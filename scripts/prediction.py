#!/usr/bin/env python3
import argparse
import yfinance as yf
import numpy as np
import pandas as pd
import torch
import torch.nn as nn
from datetime import datetime, timedelta

TICKER = "2800.HK"
MODEL_PATH = "../models/saved_models/lstm_vol_forecaster.pt"
DEVICE = "cpu"

class DeepVolLSTM(nn.Module):
    def __init__(
        self,
        input_dim: int,
        hidden_dim: int = 128,
        num_layers: int = 3,
        dropout: float = 0.3,
        bidirectional: bool = False,
        use_layernorm: bool = True,
    ):
        """
        Deep LSTM model for volatility forecasting.

        Args:
            input_dim: number of features per timestep (1 for univariate series)
            hidden_dim: number of hidden units in each LSTM layer
            num_layers: number of stacked LSTM layers 
            dropout: dropout rate applied between LSTM layers and inside MLP
            bidirectional: whether to use a forward + backward LSTM
            use_layernorm: apply layer normalization for training stability
        """
        super().__init__()
        self.hidden_dim = hidden_dim
        self.num_layers = num_layers
        self.bidirectional = bidirectional
        self.num_directions = 2 if bidirectional else 1

        # LSTM stack
        self.lstm = nn.LSTM(
            input_size=input_dim,
            hidden_size=hidden_dim,
            num_layers=num_layers,
            dropout=dropout if num_layers > 1 else 0.0,
            batch_first=True,
            bidirectional=bidirectional,
        )

        lstm_out_dim = hidden_dim * self.num_directions

        # Optional normalization on top of LSTM output
        self.use_layernorm = use_layernorm
        if use_layernorm:
            self.ln = nn.LayerNorm(lstm_out_dim)

        # MLP head for volatility mapping
        self.mlp = nn.Sequential(
            nn.Linear(lstm_out_dim, lstm_out_dim // 2),
            nn.ReLU(),
            nn.Dropout(dropout),
            nn.Linear(lstm_out_dim // 2, 1),
        )

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        """
        Forward pass through LSTM → take last hidden state → map to volatility.
        
        Input:
            x: (batch_size, seq_len, input_dim)
        Output:
            (batch_size, 1) next-step volatility forecast
        """
        # LSTM forward
        # out: (batch_size, seq_len, hidden_dim * num_directions)
        out, _ = self.lstm(x)

        # Use last time step's hidden state
        last_out = out[:, -1, :]  # (batch_size, hidden_dim * num_directions)

        if self.use_layernorm:
            last_out = self.ln(last_out)

        # MLP head
        vol_raw = self.mlp(last_out)  # (batch_size, 1)

        return vol_raw
    
# Model architecture configuration
input_dim = 1       # univariate volatility input
hidden_dim = 128    # model capacity per recurrent layer
num_layers = 3      # number of stacked LSTMs

# Initialize model for next-step volatility forecasting
model = DeepVolLSTM(
    input_dim=input_dim,
    hidden_dim=hidden_dim,
    num_layers=num_layers,
    dropout=0.3,
    bidirectional=False,  # causal (forward-only) forecasting
    use_layernorm=True,   # improve training stability
)


def main(model=model):
    """Main function to load model, download data, and make prediction."""
    print(f"Loading model from: {MODEL_PATH}")
    model.load_state_dict(torch.load(MODEL_PATH, map_location=DEVICE))
    model.to(DEVICE)
    model.eval()

    end_date = datetime.today()
    start_date = end_date - timedelta(days=365)

    print(f"Downloading price data for {TICKER}...")
    df = yf.download(TICKER, start=start_date, end=end_date,
                 auto_adjust=True, progress=False)

    if df.empty:
        raise RuntimeError("Download failed — check ticker / connection")

    # Daily returns → squared → rolling monthly variance → log transform
    log_ret = np.log(df['Close'] / df['Close'].shift(1))
    df = log_ret**2
    df = df.rolling(21).sum().shift(-21) 
    df = 0.5 * np.log(df + 1e-12)
    df = df.dropna()

    last_val = df.values[-1]
    x = torch.tensor(last_val, dtype=torch.float32).reshape(1, 1, 1).to(DEVICE)

    with torch.no_grad():
        pred_log_var = model(x).item()

    annualized_vol = np.exp(pred_log_var) * np.sqrt(12) * 100

    print("\n📌 Prediction for tomorrow")
    print(f"Ticker: {TICKER}")
    print(f"Annualized volatility: ({annualized_vol:.2f}%)")


if __name__ == "__main__":
    main(model)



# ECON4130 Term Paper  
**ARCH vs. LSTM for Volatility Forecasting in the Hong Kong Equity Market**

This repository contains all code, data processing pipelines, model implementations, results, and the final paper for my ECON4130 term project.  
The paper compares a traditional ARCH volatility model with a deep LSTM neural network for forecasting 21-day realized volatility of the Hang Seng Index.

The analysis is fully reproducible. The Python environment and dependencies are managed using **uv**.

---

## Project Overview

- **Data:** Daily Hang Seng Index returns (May 2002 – November 2025)  
- **Forecast target:** 21-day realized log volatility  
- **Models:**  
  - ARCH(7) volatility model  
  - Deep stacked LSTM with probabilistic outputs  
- **Evaluation:** Strictly out-of-sample (2022–2025), using MAE, MSE, and QLIKE  
- **Key finding:** The LSTM delivers only marginal improvements over a well-specified ARCH model, suggesting limited economic gains from added model complexity in this setting.

---

## Environment Setup (with `uv`) 

sh
uv venv
source .venv/bin/activate  # macOS/Linux
uv sync

## Repository Structure

```text
ECON4130_Term_Paper/
├── paper/      # Drafts, appendix, references, and final PDF
├── models/     # Model notebooks, training code, and saved weights
├── data/       # Raw and processed datasets
├── results/    # Out-of-sample results, figures, and tables
├── images/     # Figures used in the paper
├── scripts/    # Data construction, forecasting, and evaluation scripts
├── README.md
└── pyproject.toml

##  Author

James Thijs Maria Manuel  
ECON4130 – Machine Learning in Economics
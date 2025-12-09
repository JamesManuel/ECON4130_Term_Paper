# ECON4130 Term Paper: [Title of Your Research]

This repository includes the code, data, analysis, results, and written paper for my ECON4130 term project.  
The Python environment and dependencies are managed using **uv** for full reproducibility.

---

## 🚀 Environment Setup with `uv`

```sh
uv venv
source .venv/bin/activate  # macOS/Linux

uv sync

ECON4130_Term_Paper/
│
├── paper/           # Draft, appendix, and references
├── models/          # Model development notebooks and saved models
├── data/            # Raw and processed data
├── results/         # Out-of-sample results, figures, and tables
├── images/          # Figures and diagrams used in the paper
├── scripts/         # Data processing and evaluation scripts
├── README.md
└── pyproject.toml

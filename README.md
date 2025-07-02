# High Frequency Recurrence Index (HfRI) for NMIBC

This repository provides:

1. **HfRI Prediction Model**: A pre-trained model (`HfRI_model.RData`) to predict the likelihood of high-frequency recurrence in NMIBC patients.
2. **HfRI Calculator**: An R script to calculate the HfRI score using transcriptomic data and gene-specific weights.

---

## Repository Contents

| File | Description |
|------|-------------|
| `HfRI_model.RData` | R object containing a trained prediction model (UROMOL cohort-based, random forest) |
| `HfRI_Prediction_Model.R` | R script to predict the High-frequency Recurrence Index (HfRI) subtypes |
| `Example_dataset_for_HfRI_prediction.txt` | Example dataset for HfRI prediction |
| `HfRI_Weights.txt` | Gene and molecular weights list for calculation of HfRI |
| `HfRI_Calculator.R` | R script to calculate the High-frequency Recurrence Index (HfRI) |
| `Example_matrix_for_HfRI_calculate.txt` | Example dataset for HfRI calculation |
| `HfRI_source_data.xlsx` | Prediction results of subgroups of the cohorts used in this study |



---

## What is HfRI?

The **High-frequency Recurrence Index (HfRI)** is a transcriptome-based scoring system designed to estimate the risk of high-frequency recurrence in **non-muscle invasive bladder cancer (NMIBC)** patients.

## Citation

The paper is under review

## Contact
baek@kribb.re.kr

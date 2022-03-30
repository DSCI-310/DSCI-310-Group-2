# Based of Code form Tiffany Timbers: https://github.com/ttimbers/breast_cancer_predictor/blob/master/Makefile

all: results/final_model.rds results/accuracy_plot.png results/distribution_of_diagnosis.png results/box_hd.png results/variable_correlation.png results/final_model_quality.rds doc/heart_disease.rmd

# download data
data/raw/cleveland_raw.csv: src/download_data.r
    r src/download_data.r --url=https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.cleveland.data --out_file=data/raw/cleveland_raw.csv

# pre-process data (e.g., scale and split into train & test)
data/processed/full.csv data/processed/training.csv data/processed/test.csv scale_factor.rds: src/clean_data.r data/raw/cleveland_raw.csv
    Rscript src/clean_data.r --input=data/raw/cleveland_raw.csv --out_dir=data/processed 

# exploratory data analysis 
results/distribution_of_diagnosis.png results/box_hd.png results/variable_correlation.png: src/eda_hd.r data/processed/full.csv
    Rscript src/eda_hd.r --full=data/processed/full.csv --out_dir=results

# tune model
results/final_model.rds results/accuracy_plot.png: src/modeling.r data/processed/training.csv
    Rscript src/modeling.r --train=data/processed/training.csv --out_dir=results

# test model on unseen data
results/confusion_matrix.png: src/model_results.r data/processed/test.csv
    Rscript src/model_results.r --test=data/processed/test.csv --out_dir=results

# render report
doc/heart_disease.rmd: doc/heart_disease.rmd doc/references.bib
    Rscript -e "rmarkdown::render('doc/heart_disease.rmd')"

clean: 
    rm -rf data
    rm -rf results
    rm -rf doc/breast_cancer_predict_report.md doc/heart_disease.html
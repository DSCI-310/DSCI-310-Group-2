# Based of Code form Tiffany Timbers: https://github.com/ttimbers/breast_cancer_predictor/blob/master/Makefile

all: results/final_model.rds results/accuracy_vs_k.png results/predictor_distributions_across_class.png results/final_model_quality.rds doc/breast_cancer_predict_report.md

# download data
data/raw/cleveland_raw.csv: src/Download_data.r
    r src/Download_data.r --url=https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.cleveland.data --out_file=data/raw/cleveland_raw.csv

# pre-process data (e.g., scale and split into train & test)
data/processed/full.csv data/processed/training.csv data/processed/test.csv scale_factor.rds: src/Clean_data.r data/raw/cleveland_raw.csv
    Rscript src/Clean_data.r --input=data/raw/cleveland_raw.csv --out_dir=data/processed 

# exploratory data analysis 
results/Distribution_of_diagnosis.png results/box_hd.png results/varaible_correlation.png: src/eda_hd.r data/processed/full.csv
    Rscript src/eda_hd.r --full=data/processed/full.csv --out_dir=results

# tune model
results/final_model.rds results/Accuracy_Plot.png: src/Modeling.r data/processed/training.csv
    Rscript src/Modeling.r --train=data/processed/training.csv --out_dir=results

# test model on unseen data
results/confusion_matrix.png: src/Modelling_results.r data/processed/test.csv
    Rscript src/Modelling_results.r --test=data/processed/test.csv --out_dir=results

# render report STILL NEED TO EDIT
doc/breast_cancer_predict_report.md: doc/heart_disease.Rmd doc/references.bib
    Rscript -e "rmarkdown::render('doc/heart_disease.Rmd')"

clean: 
    rm -rf data
    rm -rf results
    rm -rf doc/breast_cancer_predict_report.md doc/heart_disease.html
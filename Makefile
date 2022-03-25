# Based of Code form Tiffany Timbers: https://github.com/ttimbers/breast_cancer_predictor/blob/master/Makefile

all: results/final_model.rds results/accuracy_vs_k.png results/predictor_distributions_across_class.png results/final_model_quality.rds doc/breast_cancer_predict_report.md

# download data
data/raw/wdbc.feather: src/download_data.py
    python src/download_data.py --out_type=feather --url=http://mlr.cs.umass.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data --out_file=data/raw/wdbc.feather

# pre-process data (e.g., scale and split into train & test)
data/processed/training.feather data/processed/test.feather scale_factor.rds: src/pre_process_wisc.r data/raw/wdbc.feather
    Rscript src/pre_process_wisc.r --input=data/raw/wdbc.feather --out_dir=data/processed 

# exploratory data analysis - visualize predictor distributions across classes
results/predictor_distributions_across_class.png: src/eda_wisc.r data/processed/training.feather
    Rscript src/eda_wisc.r --train=data/processed/training.feather --out_dir=results

# tune model (here, find K for k-nn using 30 fold cv with Cohen's Kappa)
results/final_model.rds results/accuracy_vs_k.png: src/fit_breast_cancer_predict_model.r data/processed/training.feather
    Rscript src/fit_breast_cancer_predict_model.r --train=data/processed/training.feather --out_dir=results

# test model on unseen data
results/final_model_quality.rds: src/breast_cancer_test_results.r data/processed/test.feather
    Rscript src/breast_cancer_test_results.r --test=data/processed/test.feather --out_dir=results

# render report
doc/breast_cancer_predict_report.md: doc/heart_disease.Rmd doc/references.bib
    Rscript -e "rmarkdown::render('doc/heart_disease.Rmd')"

clean: 
    rm -rf data
    rm -rf results
    rm -rf doc/breast_cancer_predict_report.md doc/heart_disease.html
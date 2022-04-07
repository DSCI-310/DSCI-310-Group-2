# Based of Code from Tiffany Timbers: https://github.com/ttimbers/breast_cancer_predictor/blob/master/Makefile

all: results/accuracy_plot.png results/box_hd.png results/distribution_of_diagnosis.png results/variable_correlation.png results/accuracy_plot.png results/confusion_matrix.png doc/heart_disease.md doc/heart_disease.html doc/heart_disease.pdf

# download data
data/raw/cleveland_raw.csv: src/download_data.r
	Rscript src/download_data.r --url=https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.cleveland.data --out_file=data/raw/cleveland_raw.csv

# pre-process data (e.g., scale and split into train & test)
data/processed/full.csv data/processed/training.csv data/processed/test.csv: src/preprocess_data.r data/raw/cleveland_raw.csv
	Rscript src/preprocess_data.r --input=data/raw/cleveland_raw.csv --out_dir=data/processed 

# exploratory data analysis 
results/box_hd.png results/distribution_of_diagnosis.png results/variable_correlation.png: src/eda_hd.r data/processed/full.csv
	Rscript src/eda_hd.r --full=data/processed/full.csv --out_dir=results

# tune model and test model on unseen data
results/accuracy_plot.png results/confusion_matrix.png: src/modeling.r data/processed/training.csv data/processed/test.csv
	Rscript src/modeling.r --train=data/processed/training.csv --test=data/processed/test.csv --out_dir=results

# render report
doc/heart_disease.md doc/heart_disease.html doc/heart_disease.pdf: data/variables.csv data/processed/full.csv results/box_hd.png results/distribution_of_diagnosis.png results/variable_correlation.png results/accuracy_plot.png results/confusion_matrix.png doc/heart_disease.rmd doc/references.bib
	Rscript -e "rmarkdown::render('doc/heart_disease.rmd', c('bookdown::html_document2', 'bookdown::pdf_document2')) "

clean: 
	rm -rf data/processed
	rm -rf data/raw
	rm -rf results
	rm -rf doc/heart_disease.html doc/heart_disease.pdf



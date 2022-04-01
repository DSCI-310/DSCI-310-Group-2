"Cleans and prepocesses data csv data from the web to a local filepath a csv 
Writes the training and test data to separate feather files.

Usage: src/preprocess_data.r --input=<input> --out_dir=<out_dir>

Options:
--input=<input>       Path (including filename) to raw data (csv file)
--out_dir=<out_dir>   Path to directory where the processed data should be written
" -> doc

library(tidyverse)
library(docopt) 
library(tidymodels)
library(ggplot2)
library(GGally)
library(rlang)
set.seed(4)

source("R/clean_data.r")

opt <- docopt(doc)

main <- function(input, out_dir){
    
    # Read Data and Add Colnames and Clean it
    raw_data <- read.csv(input) 
    colnames(raw_data) <- c("age",
                            "sex",
                            "chest_pain",
                            "resting_blood_pressure",
                            "serum_cholesterol",
                            "fasting_blood_sugar",
                            "resting_ecg",
                            "max_heart_rate",
                            "exercise_induced_angina",
                            "oldpeak",
                            "slope",
                            "num_of_major_vessels",
                            "thalassemia",
                            "diagnosis")
    raw_data_clean <- clean_data(raw_data)
    raw_data_numerical <- raw_data_clean[ -c(2:3, 6:7, 9, 11, 13)]
    
    
    # split into training and test data sets
    raw_data_split <- initial_split(raw_data_numerical, prop = 0.75, strata = diagnosis)
    data_train <- training(raw_data_split)
    data_test <- testing(raw_data_split) 
    
    
    # scale test data using scale factor
    x_train <- data_train %>% select(-diagnosis) 
    x_test <- data_test %>% select(-diagnosis)
    
    scaler <- preProcess(x_train, method = c("center", "scale"))
    
    x_train_scaled <- predict(scaler, x_train)
    x_test_scaled <- predict(scaler, x_test)
    
    training_scaled <- x_train_scaled %>% mutate(class = data_train %>% select(diagnosis) %>% pull())
    test_scaled <- x_test_scaled %>% mutate(class = data_test %>% select(diagnosis) %>% pull())
    
    
    # write scale factor to a file
    try({
        dir.create(out_dir)
    })
    saveRDS(pre_process_scaler, file = paste0(out_dir, "/scale_factor.rds"))
    
    # write training and test data to feather files
    write.csv(raw_data_numerical, paste0(out_dir, "/full.csv"))
    write.csv(training_scaled, paste0(out_dir, "/training.csv"))
    write.csv(test_scaled, paste0(out_dir, "/test.csv"))
}
main(opt[["--input"]], opt[["--out_dir"]])

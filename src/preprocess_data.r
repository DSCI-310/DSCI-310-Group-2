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
library(magrittr)
library(dplyr)
set.seed(4)

source("R/clean_data.r")
source("R/diagnosis.r")

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
    raw_data_numerical <- subset(raw_data_clean, select = -c(sex, chest_pain, 
                                                         fasting_blood_sugar, resting_ecg, 
                                                         exercise_induced_angina, slope,
                                                         thalassemia))
    
    raw_data_num_diag <- diagnosis(raw_data_numerical)
    
    
    # split into training and test data sets
    raw_data_split <- initial_split(raw_data_num_diag, prop = 0.75, strata = diagnosis)
    data_train <- training(raw_data_split)
    data_test <- testing(raw_data_split) 
    
    
    # scale test data using scale factor
    # x_train <- data_train %>% dplyr::select(-diagnosis)
    # x_test <- data_test %>% dplyr::select(-diagnosis)
    
    x_train <- subset(data_train, select = -diagnosis)
    x_test <- subset(data_test, select = -diagnosis)
    full_data <- subset(raw_data_num_diag, select = -diagnosis)
   
    
#     scaler <- preProcess(x_train, method = c("center", "scale"))
    
#     x_train_scaled <- predict(scaler, x_train)
#     x_test_scaled <- predict(scaler, x_test)
    
#     x_train_scaled <- scale(x_train)
#     x_test_scaled <- scale(x_test)
    
#     training_scaled <- x_train_scaled %>% mutate(class = data_train %>% dplyr::select(diagnosis) %>% pull())
#     test_scaled <- x_test_scaled %>% mutate(class = data_test %>% dplyr::select(diagnosis) %>% pull())
    
    x_train_scaled <- scale(x_train)
    x_test_scaled <- scale(x_test)
    full_data_scaled <- scale(full_data)

    training_scaled <- x_train_scaled
    test_scaled <- x_test_scaled
    full_data_scaled_diag <- full_data_scaled

    training_scaled <- cbind(x_train_scaled, data_train$diagnosis)
    test_scaled <- cbind(test_scaled, data_test$diagnosis)
    full_data_scaled_diag <- cbind(full_data_scaled_diag, raw_data_num_diag$diagnosis)
    
    training_scaled<-as.data.frame(training_scaled)
    test_scaled<-as.data.frame(test_scaled)
    full_data_scaled_diag<-as.data.frame(full_data_scaled_diag)

    colnames(training_scaled) <- c("age",
                    "resting_blood_pressure",
                    "serum_cholesterol",
                    "max_heart_rate",
                    "oldpeak",
                    "num_of_major_vessels",
                    "diagnosis")

    colnames(test_scaled) <- c("age",
                               "resting_blood_pressure",
                               "serum_cholesterol",
                               "max_heart_rate",
                               "oldpeak",
                               "num_of_major_vessels",
                               "diagnosis")
    
    colnames(full_data_scaled_diag) <- c("age",
                               "resting_blood_pressure",
                               "serum_cholesterol",
                               "max_heart_rate",
                               "oldpeak",
                               "num_of_major_vessels",
                               "diagnosis")
    
    full_data_scaled_diag$diagnosis <- as.factor(full_data_scaled_diag$diagnosis)
    training_scaled$diagnosis <- as.factor(training_scaled$diagnosis)
    test_scaled$diagnosis <- as.factor(test_scaled$diagnosis)
    
 
    
    
    # # write scale factor to a file
    # try({
    #     dir.create(out_dir)
    # })
    # saveRDS(scaler, file = paste0(out_dir, "/scale_factor.rds"))
    
    # write training and test data to feather files
    dir.create(out_dir, recursive = TRUE)
    write.csv(full_data_scaled_diag, paste0(out_dir, "/full.csv"), row.names=FALSE)
    write.csv(training_scaled, paste0(out_dir, "/training.csv"), row.names=FALSE)
    write.csv(test_scaled, paste0(out_dir, "/test.csv"), row.names=FALSE)
}
main(opt[["--input"]], opt[["--out_dir"]])

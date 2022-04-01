"Fits a k-nn model on the pre-processed training data from the Cleveland Heart Disease dataset (https://archive-beta.ics.uci.edu/ml/datasets/heart+disease) Saves the model as a rds file.
Usage: src/modeling.r --train=<train> --out_dir=<out_dir>
  
Options:
--train=<train>     Path (including filename) to training data (which needs to be saved as a csv file)
--out_dir=<out_dir> Path to directory where the serialized model should be written
" -> doc

library(tidyverse)
library(tidymodels)
library(ggplot2)
library(GGally)
library(docopt)
library(rlang)
library(kernlab)
source("R/accuracy_plot.r")
set.seed(4)

opt <- docopt(doc)

main <- function(train, out_dir) {
    try({
        dir.create(out_dir)
    })
    # Perform Cross Validation 
    training_data <- read.csv(train) 
    hd_vfold <- vfold_cv(training_data, v = 5, strata = diagnosis)

   recipe <- recipe(diagnosis ~ ., data = training_data) %>%
       step_scale(all_predictors()) %>%
       step_center(all_predictors())
  

    # Create Classifier and Tuning 
    knn_spec <- nearest_neighbor(weight_func = "rectangular", neighbors = tune()) %>%
        set_engine("kknn") %>%
        set_mode("classification")

    k_vals <- tibble(neighbors = seq(from = 1, to = 100, by = 5))

    knn_results <- workflow() %>%
        add_recipe(recipe) %>%
        add_model(knn_spec) %>%
        tune_grid(resamples = hd_vfold, grid = k_vals) %>%
        collect_metrics() 

    accuracies <- knn_results %>%
        filter(.metric == "accuracy")

    accuracy_vs_k <- accuracy_plot(accuracies)
    ggsave(paste0(out_dir, "/accuracy_plot.png"), 
         data,
         width = 8, 
         height = 10)
    accuracy_vs_k
 
      
    # Prediction and Training 
    knn_spec <- nearest_neighbor(weight_func = "rectangular", neighbors = 12) %>%
        set_engine("kknn") %>%
        set_mode("classification")


    knn_fit <- workflow() %>%
        add_recipe(recipe) %>%
        add_model(knn_spec) %>%
        fit(data = hd_train)

    
   # Fit final model 
    saveRDS(knn_fit, file = paste0(out_dir, "/final_model.rds"))
}
main(opt[["--train"]], opt[["--out_dir"]])



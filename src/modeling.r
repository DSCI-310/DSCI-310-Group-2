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
library(caret)
library(rlang)
source("R/accuracy_plot.r")
set.seed(4)

opt <- docopt(doc)

main <- function(train, out_dir) {
    
  # Tune hyperparameters ----------------------------------------------------

  train_data <- read_feather(train) 
  x_train <- train_data %>% 
    select(-diagnosis)
  y_train <- train_data %>% 
    select(diagnosis) %>% 
    mutate(diagnosis = as.factor(diagnosis)) %>% 
    pull()
  k = data.frame(k = seq(1, 100, by = 2))
  cross_val <- trainControl(method="cv", number = 5)
  model_cv_5fold <- train(x = x_train, y = y_train, method = "knn", 
                           metric = "Kappa", tuneGrid = k, trControl = cross_val)
  
  # Visualize kappa for K's ----------------------------------------------

  kappa_vs_k <- model_cv_5fold$results %>% 
    ggplot(aes(x = k, y = Kappa)) +
      geom_point() +
      geom_errorbar(aes(ymin = Kappa - (KappaSD/sqrt(5)), ymax = Kappa + (KappaSD/sqrt(5)))) +
      xlab("K") +
      ylab("Average Cohen's Kappa \n (5-fold cross-validation)") 
  try({
    dir.create(out_dir)
  })
  ggsave(paste0(out_dir, "/kappa_vs_k.png"), kappa_vs_k, width = 5, height = 3)
  
  # Fit final model ---------------------------------------------------------
  final_model <- train(x = x_train, y = y_train, method = "knn", 
                       tuneGrid = data.frame(k = model_cv_5fold$bestTune$k))
  saveRDS(final_model, file = paste0(out_dir, "/final_model.rds"))
}
main(opt[["--train"]], opt[["--out_dir"]])



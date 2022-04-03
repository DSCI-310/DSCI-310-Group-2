"Assesses model's accuracy on a test data set.
Usage: src/model_results.r --test=<test> --out_dir=<out_dir>
Options:
--test=<test>          Path (including filename) to test data (which needs to be saved as a feather file)
--out_dir=<out_dir>    Path to directory where the plots should be saved
" -> doc

library(tidyverse)
library(caret)
library(docopt)
set.seed(2019)

opt <- docopt(doc)

main <- function(test, out_dir) {

 # Load and wrangle test data ----------------------------------------------
  test_data <- read.csv(test)
  x_test <- test_data %>%
    select(-diagnosis)
  y_test <- test_data %>%
    select(diagnosis) %>%
    mutate(diagnosis = as.factor(diagnosis)) %>%
    pull()

  # Load model and predict --------------------------------------------------
  final_model <- readRDS("results/final_model.rds")
  y_pred <- predict(final_model, x_test)

  # assess model accuracy ---------------------------------------------------
  model_quality <- confusionMatrix(y_pred, y_test)
  saveRDS(model_quality, file = paste0(out_dir, "/final_model_quality.rds"))
}
main(opt[["--test"]], opt[["--out_dir"]])

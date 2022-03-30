"Assesses model's accuracy on a test data set.
Usage: src/Model_results.r --test=<test> --out_dir=<out_dir>
Options:
--test=<test>          Path (including filename) to test data (which needs to be saved as a feather file)
--out_dir=<out_dir>    Path to directory where the plots should be saved
" -> doc
  
library(feather)
library(tidyverse)
library(caret)
library(docopt)
set.seed(2019)

opt <- docopt(doc)

main <- function(test, out_dir) {
    # Load and wrangle test data ----------------------------------------------
    test_data <- read_csv(test) 
   
    # Load model and predict --------------------------------------------------
    final_model <- readRDS("results/final_model.rds")
    
    hd_predictions <- predict(final_model, test_data)  %>%
        bind_cols(test_data)
    
    hd_predictions %>%
        metrics(truth = diagnosis, estimate = .pred_class) %>%
        filter(.metric == "accuracy")
    
    # assess model accuracy ---------------------------------------------------
    confusion_mat <- hd_predictions %>%
        conf_mat(truth = diagnosis, estimate = .pred_class)
    
    ggsave(paste0(out_dir, "/confusion_matrix.png"), 
           confusion_mat,
           width = 8, 
           height = 10)
}
  
main(opt[["--test"]], opt[["--out_dir"]])
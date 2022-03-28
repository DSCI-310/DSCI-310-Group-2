"Creates eda plots for the pre-processed training data from Preprocessed cleveland heart disease data (from https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.cleveland.data).
Saves the plots as a pdf and png file.
Usage: src/eda_wisc.r --train=<train> --out_dir=<out_dir>
  
Options:
--full=<full>     Path (including filename) to raw data
--train=<train>     Path (including filename) to training data 
--out_dir=<out_dir> Path to directory where the plots should be saved
" -> doc

library(feather)
library(tidyverse)
library(caret)
library(docopt)
library(ggridges)
library(ggthemes)
theme_set(theme_minimal())

opt <- docopt(doc)

main <- function(full, train, out_dir) {
    train_data <- read_csv(train)
    full_data <- read_csv(full)
    # generate pie plot to visualize distribution of diagnosis
    pie_distribution <- pie(table(raw_data$diagnosis), col = c("Blue", "Red"))
    ggsave(paste0(out_dir, "/Distribution_of_diagnosis.png"), 
         pie_distribution,
         width = 8, 
         height = 10)
    
    # generate correlation plot
    data_correlation <- ggcorr(full_data, label = TRUE, label_size = 4, label_round = 2, label_alpha = FALSE)
    ggsave(paste0(out_dir, "/varaible_correlation.png"), 
         data_correlation,
         width = 8, 
         height = 10)
        
    
}

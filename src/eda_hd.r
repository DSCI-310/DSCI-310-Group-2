"Creates eda plots for the pre-processed data from the Preprocessed cleveland heart disease data (from https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.cleveland.data).
Saves the plots as pdf and pnt file.

Usage: src/eda_hd.r --full=<full> --out_dir=<out_dir>

Options:
--full=<full>     Path (including filename) to training data (must be a csv)
--out_dir=<out_dir> Path to directory where the plots should be saved
" -> doc

library(tidyverse)
library(caret)
library(docopt)
library(ggthemes)
library(ggplot2)
library(GGally)
theme_set(theme_minimal())

opt <- docopt(doc) 

main <- function(full, out_dir) {
    
    data <- read.csv(full)
    
    
    # generate box plot 

    box_hd <- ggplot(data, aes(x=age, y=factor(diagnosis))) + 
        geom_boxplot() +
        coord_flip()
    
    ggsave(paste0(out_dir, "/box_hd.png"), 
         box_hd,
         width = 8, 
         height = 10)
    
    
    # generate pie plot to visualize distribution of diagnosis
    diagnosis_heart_disease <- group_by(data, diagnosis) %>%
    summarize(count = n(),
              percentage = n() / nrow(data) * 100)
    
    names(diagnosis_heart_disease)[1] <- 'diagnosis'
    names(diagnosis_heart_disease)[2] <- 'value'
    diagnosis_heart_disease$diagnosis <- as.factor(diagnosis_heart_disease$diagnosis)

    pie_distribution <- ggplot(diagnosis_heart_disease, aes(x="", y=value, fill= diagnosis)) +
        geom_bar(stat="identity", width=1, color="white") +
        coord_polar("y", start=0) +
        theme_void() 
    ggsave(paste0(out_dir, "/distribution_of_diagnosis.png"), 
         pie_distribution,
         width = 8, 
         height = 10)
  
    
    
    # generate correlation plot
    data_correlation <- ggcorr(data, label = TRUE, label_size = 4, label_round = 2, label_alpha = FALSE)
    ggsave(paste0(out_dir, "/variable_correlation.png"), 
         data_correlation,
         width = 8, 
         height = 10)
        
}
main(opt[["--full"]], opt[["--out_dir"]])

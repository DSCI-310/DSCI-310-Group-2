"Creates eda plots for the pre-processed data from the Preprocessed cleveland heart disease data (from https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.cleveland.data).
Saves the plots as pdf and pnt file.
Usage: src/eda_hd.r --url=<url> --out_file=<out_file>

Options:
--url=<url>              URL from where to download the data (must be in standard csv format)
--out_file=<out_file>    Path (including filename) of where to locally write the file
" -> doc

library(feather)
library(tidyverse)
library(caret)
library(docopt)
library(ggridges)
library(ggthemes)
theme_set(theme_minimal())

opt <- docopt(doc)

main <- function(train, out_dir) {
    # generate box plot
    box_hd <- attribute_box_plots(train, diagnosis)
    ggsave(paste0(out_dir, "/box_hd.png"), 
         pie_distribution,
         width = 8, 
         height = 10)
    
    # generate pie plot to visualize distribution of diagnosis
    pie_distribution <- pie(table(train$diagnosis), main = "Figure 3: Distribution of Diagnosis", col = c("Blue", "Red"))
    ggsave(paste0(out_dir, "/Distribution_of_diagnosis.png"), 
         pie_distribution,
         width = 8, 
         height = 10)
    
    # generate correlation plot
    data_correlation <- ggcorr(heart_disease_numerical, label = TRUE, label_size = 4, label_round = 2, label_alpha = FALSE) +
                        ggplot2::labs(title = "Figure 4: Correlation between Variables")
    ggsave(paste0(out_dir, "/varaible_correlation.png"), 
         data_correlation,
         width = 8, 
         height = 10)
        
    
}

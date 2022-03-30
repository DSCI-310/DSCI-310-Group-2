"Creates eda plots for the pre-processed data from the Preprocessed cleveland heart disease data (from https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.cleveland.data).
Saves the plots as pdf and pnt file.
Usage: src/eda_hd.r --full=<full> --out_dir=<out_dir>

Options:
--full=<full>     Path (including filename) to training data (must be a csv)
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

main <- function(full, out_dir) {
    
    data <- read_csv(full)
    # generate box plot
    box_hd <-  boxplot(age ~ diagnosis,
                    data=heart_disease_numerical,
                    xlab="Heart Disease",
                    ylab="Age",
                    col="orange",
                    border="brown"
                    )
    ggsave(paste0(out_dir, "/box_hd.png"), 
         box_hd,
         width = 8, 
         height = 10)
    
    # generate pie plot to visualize distribution of diagnosis
    pie_distribution <- pie(table(data$diagnosis), col = c("Blue", "Red"))
    ggsave(paste0(out_dir, "/distribution_of_diagnosis.png"), 
         pie_distribution,
         width = 8, 
         height = 10)
    
    # generate correlation plot
    data_correlation <- ggcorr(data, label = TRUE, label_size = 4, label_round = 2, label_alpha = FALSE)
    ggsave(paste0(out_dir, "/varaible_correlation.png"), 
         data_correlation,
         width = 8, 
         height = 10)
        
}

main(opt[["--full"]], opt[["--out_dir"]])

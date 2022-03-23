library(tidyverse)
library(tidymodels)
library(ggplot2)
library(GGally)

heart_disease <- read.csv("https://github.com/DSCI-310/DSCI-310-Group-2/blob/Rmd/data/processed-cleveland.csv", header = FALSE)
path_out = '../data/'
fileName = paste(path_out, "processed_cleveland.csv", sep = '')
write.csv(heart_disease, fileName)
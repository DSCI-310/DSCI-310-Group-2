library(tidyverse)
library(tidymodels)
library(ggplot2)
library(GGally)

heart_disease <- read.csv("../data/processed_cleveland.csv", header = FALSE)
heart_disease_clean <- clean_data(heart_disease)
path_out = '../data/'
fileName = paste(path_out, "heart_disease_clean.csv", sep = '')
write.csv(heart_disease_clean, fileName)
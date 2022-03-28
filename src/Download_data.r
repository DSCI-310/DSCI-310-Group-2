"Downloads data csv data from the web to a local filepath a csv 
Writes the training and test data to separate feather files.

Usage: src/Download_data.r --url=<url> --out_file=<out_file>

Options:
--url=<url>              URL from where to download the data (must be in standard csv format)
--out_file=<out_file>    Path (including filename) of where to locally write the file
" -> doc

library(tidyverse)
library(tidymodels)
library(ggplot2)
library(GGally)
library(rlang)

from docopt import docopt

opt <- docopt(doc)

main <- function(url, out_file) {
#DO A TRY CATCH FOR WEBSITE THAT DOES NOT WORK
    
    data <- read.csv(url, header = FALSE)
    
    if (dir.exists(out_file)) {
        write.csv(data, out_file)
    } else {
        dir.create(out_file)
        write.csv(data, out_file)
    }
}

main(opt[["--url"]], opt[["--out_file"]])
                      
                      



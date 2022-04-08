# Obtain image from the source below
FROM ubcdsci/jupyterlab:v0.9.0

RUN conda install --yes -c conda-forge r-tidyverse=1.3.1 
RUN conda install --yes -c conda-forge r-tidymodels=0.1.4
RUN conda install --yes -c conda-forge r-ggally=2.1.2 
RUN conda install --yes -c conda-forge r-testthat=3.1.2
RUN conda install --yes -c conda-forge r-kknn=1.3.1
RUN conda install --yes -c conda-forge r-bookdown=0.25
RUN conda install --yes -c conda-forge r-docopt=0.7.1
RUN conda install --yes -c conda-forge r-rmarkdown=2.13
RUN conda install --yes -c conda-forge r-tinytex=0.37
RUN conda install --yes -c conda-forge r-knitr=1.37
RUN conda install --yes -c conda-forge r-magrittr=2.0.3
RUN conda install --yes -c conda-forge r-dplyr=1.0.8
RUN conda install --yes -c conda-forge r-rlang=1.0.2
RUN conda install --yes -c conda-forge r-ggthemes=4.2.4
RUN Rscript -e 'install.packages("devtools");devtools::install_github("DSCI-310/DSCI-310-Group-8-package", force = TRUE)'

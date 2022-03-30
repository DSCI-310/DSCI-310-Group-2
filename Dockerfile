# Obtain image from the source below
FROM ubcdsci/jupyterlab:v0.13.0

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
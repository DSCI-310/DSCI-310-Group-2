# Obtain image from the source below
FROM ubcdsci/jupyterlab:v0.9.0

RUN conda install --yes -c conda-forge r-tidyverse=1.3.1 
RUN conda install --yes -c conda-forge r-tidymodels=0.1.4
RUN conda install --yes -c conda-forge r-ggally=2.1.2 
RUN conda install --yes -c conda-forge r-testthat=3.1.2
RUN conda install --yes -c conda-forge r-kknn=1.3.1

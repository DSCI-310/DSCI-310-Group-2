# Obtain image from the source below
FROM ubcdsci/jupyterlab

RUN conda install --yes --quiet --channel conda-forge \
    matplotlib=3.5.1 \
    numpy=1.22.2 \
    pandas=1.4.1 \

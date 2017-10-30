# Builds on docker-stacks/scipy-notebook by Jupyter Project

FROM jupyter/scipy-notebook:2d878db5cbff

MAINTAINER Kostas Stamatiou <kostas.stamatiou@digitalglobe.com>

USER root

# gdal binaries for protogen
# these are not the same as the gdal python bindings below, we need to fix this
RUN apt-get update && \
    apt-get install -y --no-install-recommends gdal-bin && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm /bin/sh && ln -s /bin/bash /bin/sh  # default command interpreter is bash

USER $NB_USER

# Install ipyleaflet in python3 environment
RUN conda install --quiet --yes -c conda-forge ipyleaflet && \
    conda clean -tipsy

# Install packages in python2 environment
RUN source $CONDA_DIR/bin/activate python2 && \
    conda install --quiet --yes -c conda-forge gdal=2.1.3 cryptography ipyleaflet rasterio=1.0a5 && \
    conda clean -tipsy && \
    pip install --upgrade pip && \
    pip install gbdxtools \
                shapely

# Install protogen in python2 environment
# If you don't have access, please comment out the next block
ENV PROTOUSER
ENV PROTOPASSWORD
RUN source $CONDA_DIR/bin/activate python2 && \
    git clone https://${PROTOUSER}:${PROTOPASSWORD}@github.com/digitalglobe/protogen && \
    cd protogen && \
    python setup.py install && \
    cd .. && \
    rm -r protogen

# Add readme
ADD Readme.ipynb /home/$NB_USER/work/

# Add example notebooks
RUN git clone https://github.com/platformstories/notebooks

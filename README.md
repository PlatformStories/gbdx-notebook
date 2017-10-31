# gbdx-notebook

**This repository is not maintained. For a hosted notebook environment, please visit [https://notebooks.geobigdata.io](https://notebooks.geobigdata.io)**

A GBDX notebook server in Docker. Is is based on the [Jupyter Notebook Scientific Python Stack](https://github.com/jupyter/docker-stacks/tree/master/scipy-notebook)
and also includes packages for local prototyping with geospatial raster data and launching workflows on GBDX (gdal, rasterio, protogen, gdbxtools).

The server can be run locally or as part of [a Jupyter hub](https://github.com/digitalglobe/gbdx-jupyter-hub).

## Local installation

Install [Docker](https://docs.docker.com/engine/installation/) and start the docker engine (this step is OS dependent).

Clone this repository:

```bash
git clone https://github.com/platformstories/gbdx-notebook
```

Then:

```bash
cd gbdx-notebook
docker build -t gbdx-notebook .
```

Access to the Protogen repo is internal. Fill in your github username and password next to `ENV PROTOUSER` and `ENV PROTOPASSWORD`, respectively. If you don't have access to the repo, comment out the corresponding lines in the Dockerfile.

## Run the notebook server

To run the notebook server with root privileges:

```bash
docker run -it -p 8888:8888 -e GRANT_SUDO=yes --user root gbdx-notebook
```

You can find more options [here](https://github.com/jupyter/docker-stacks/tree/master/scipy-notebook).

The Jupyter dashboard is accessible via your browser at ```localhost:8888```.

You can stop the server with Ctrl-C. If you want to restart a particular container which, e.g., contains work that you have saved:

```bash
docker start <container-id>
docker attach <container-id>
```



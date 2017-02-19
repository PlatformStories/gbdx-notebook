# gbdx-notebook

A GBDX notebook server in Docker. Is is based on the [Jupyter Notebook Scientific Python Stack](https://github.com/jupyter/docker-stacks/tree/master/scipy-notebook)
and also includes packages for local prototyping with geospatial raster data and launching workflows on GBDX (gdal, protogen, gdbxtools).

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

## Run the notebook

To run the notebook with root privileges:

```bash
docker run -it -p 8888:8888 -e GRANT_SUDO=yes --user root gbdx-notebook
```

You can find more options [here](https://github.com/jupyter/docker-stacks/tree/master/scipy-notebook).

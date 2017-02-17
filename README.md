# gbdx-notebook

A GBDX notebook based on the [Jupyter SciPy notebook](https://github.com/jupyter/docker-stacks/tree/master/scipy-notebook)
which also includes gdal, protogen and gdbxtools.

This notebook allows local prototyping work as well as launching workflows on GBDX.
It can be run locally or as part of [a Jupyter hub](https://github.com/digitalglobe/gbdx-jupyter-hub).

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

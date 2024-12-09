This repository contains the necessary files to build a
reproducible pipeline using Docker and `{renv}`.
There are two `Dockerfile`s in this repository: one that
defines the base image, which includes R and development
libraries to compile R packages, and another that defines
the pipeline itself.

- First, build the base image. In this repo, the base image
  targets the Raspberry Pi's 4 architecture. Adapt this
  to another if necessary, or skip it entirely. Build the
  base image using: `docker build -t base_image -f Dockerfile_base .`
  Run a container with `docker run -it base_image` to start
  an interactive R session.

- Second, build the pipeline itself: `docker build -t pipeline .`
  If you didn't build the base image, you will need to edit the
  `Dockerfile` to pull from another image first.
  Building the image runs the pipeline. Running a container simply
  copies the output into the `output` folder. So to get this
  output, you need to run the container with volume:
  `docker run --rm --name pipeline_container -v /path/to/your/local/folder:/output/:rw pipeline`
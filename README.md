# kathara-docker-images
Base repository to build Kathara Docker images for redesunlu's university courses, based on the [Docker-Images repository](https://github.com/KatharaFramework/Docker-Images) of the Kathara Framework. 

This repository contains `Dockerfile`s used to build Kathará images. A list of the Docker images we provide can be found at [this page](https://hub.docker.com/u/docentetyr/) in the Docker Hub.
Images are built both with `docker build` and with `docker buildx` for multi-architecture support.
Currently our images are based on Debian 12 and are compiled for `amd64` and `arm64`.
If you need images based on other Linux distributions, feel free to create a PR with other Dockerfiles.

Currently available images are:
- `base`: base image with some TyR course customizations
- `troubleshooting`: TyR quagga-based image for troubleshooting and IPv6 labs
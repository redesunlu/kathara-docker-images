# kathara-docker-images
Base repository to build Kathara Docker images for redesunlu's university courses, based on the [Docker-Images repository](https://github.com/KatharaFramework/Docker-Images) of the Kathara Framework. 

This repository contains `Dockerfile`s used to build Kathará images. A list of the Docker images we provide can be found at [this page](https://hub.docker.com/u/docentetyr/) in the Docker Hub.
Images are built both with `docker build` and with `docker buildx` for multi-architecture support.
Currently our images are based on Debian 12 and are compiled for `amd64` and `arm64`.
If you need images based on other Linux distributions, feel free to create a PR with other Dockerfiles.

Currently available images are:
- `base-2022`: base image with some TyR course customizations, used by default in 2022
- `base-2023`: TyR quagga-based image for troubleshooting and IPv6 labs, used by default in 2023

## Building from source
To build an image from source, run `make <image_name>` to build for the current architecture.
To build an image with `docker buildx` for multi-architectures use the command `make <image_name>-multi`.

**Beware**: building images with `docker buildx` automatically push the images on the [Redes Unlu](https://hub.docker.com/u/docentetyr) Docker Hub.
 If you are not allowed to push, change the `Makefile` before running `make`. 

**Note**: In order to push images to the Docker Hub, you have to log in to it first. Run `docker login` before pushing images to Docker Hub.

Example: `make base-2022` or `make base-2023`.

## Extend Kathará Images

The easiest way to extend a Kathará image is to clone this repository, change the Dockerfile according to your needings and locally build the new image.

If you instead want to alter (locally) an existing Kathará image, refer to the following steps:
1. `docker pull kathara/<image_name>`
2. `docker run -tid --name <container_name> kathara/<image_name>`
3. `docker exec -ti <container_name> bash`
4. Do your thing, then exit.
5. `docker commit <container_name> kathara/<image_new_name>`
6. `docker rm -f <container_name>`
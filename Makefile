BUILDX=docker buildx build --platform linux/amd64,linux/arm64
DOCKER_USERNAME ?= fernandezm
#APPLICATION_NAME ?= hello-world

.PHONY: base-2022 base-2023

all: base-2022 base-2023
all-multi: create-builder base-2022-multi base-2023-multi delete-builder

pushall:
	docker push ${DOCKER_USERNAME}/tyr-base-2022
	docker push ${DOCKER_USERNAME}/tyr-base-2023

base-2022:
	docker build -t ${DOCKER_USERNAME}/tyr-base-2022 base-2022

base-2023: base-2022
	docker build -t ${DOCKER_USERNAME}/tyr-base-2023 base-2023

base-2022-multi: create-builder
	$(BUILDX) -t ${DOCKER_USERNAME}/tyr-base-2022 --push base-2022

base-2023-multi: create-builder base-2022-multi
	$(BUILDX) -t ${DOCKER_USERNAME}/tyr-base-2023 --push base-2023

create-builder:
	docker buildx create --name kat-builder --use
	docker buildx inspect --bootstrap

delete-builder:
	docker buildx rm kat-builder

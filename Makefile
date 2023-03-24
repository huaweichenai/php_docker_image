#!make
include .env
export $(shell sed 's/=.*//' .env)

build:
ifneq ($(proxy),)
	docker build -t php:local-$(PHP_LOCAL_IMAGE_VERSION) -f ./Dockerfile-$(PHP_LOCAL_IMAGE_VERSION) --build-arg PHP_LOCAL_IMAGE_VERSION=$(PHP_LOCAL_IMAGE_VERSION) --build-arg http_proxy=$(proxy) --build-arg https_proxy=$(proxy) .
else
	docker build -t php:local-$(PHP_LOCAL_IMAGE_VERSION) -f ./Dockerfile-$(PHP_LOCAL_IMAGE_VERSION) --build-arg PHP_LOCAL_IMAGE_VERSION=$(PHP_LOCAL_IMAGE_VERSION) .
endif

build-7.2-alpine:
ifneq ($(proxy),)
	docker build -t php:local-7.2-alpine -f ./Dockerfile-7.2-alpine --build-arg PHP_LOCAL_IMAGE_VERSION=$(PHP_LOCAL_IMAGE_VERSION) --build-arg http_proxy=$(proxy) --build-arg https_proxy=$(proxy) .
else
	docker build -t php:local-7.2-alpine -f ./Dockerfile-7.2-alpine --build-arg PHP_LOCAL_IMAGE_VERSION=$(PHP_LOCAL_IMAGE_VERSION) .
endif

build-internal:
	docker build -t php:local-7 -f ./Dockerfile-7-internal .

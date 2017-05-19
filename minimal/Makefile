ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

build:
	docker build \
		-f Dockerfile \
		-t mindreframer/docker-dev-vnc-mini \
		.

start:
	docker run  \
		--rm \
		-p 5901:5901 \
		-v ${ROOT_DIR}:/app \
		mindreframer/docker-dev-vnc-mini
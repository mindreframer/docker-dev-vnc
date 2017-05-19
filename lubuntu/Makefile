ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

build:
	docker build \
		-f Dockerfile \
		-t mindreframer/docker-dev-lubuntu \
		.

start:
	docker run \
	-it \
	-d \
	--rm \
	-p 5900:5900 \
	-e VNC_PASSWORD=vncrocks \
	mindreframer/docker-dev-lubuntu


DPID:=$(shell docker ps|grep docker-dev-lubuntu|awk '{print $$1}')

kill:
	docker kill ${DPID}

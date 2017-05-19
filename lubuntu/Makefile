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
	-p 6080:80 \
	-p 5900:5900 \
	-e VNC_PASSWORD=vncrocks \
	dorowu/ubuntu-desktop-lxde-vnc


DPID:=$(shell docker ps|grep ubuntu-desktop-lxde-vnc|awk '{print $$1}')

kill:
	docker kill ${DPID}

ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

build:
	docker build \
		-f Dockerfile \
		-t mindreframer/docker-dev-lubuntu \
		.

start:
	docker run \
	-it \
	--rm \
	-p 5900:5900 \
	-p 6000:4000 \
	--cap-add=SYS_PTRACE \
	-e VNC_PASSWORD=vncrocks \
	mindreframer/docker-dev-lubuntu


DPID:=$(shell docker ps|grep docker-dev-lubuntu|awk '{print $$1}')

kill:
	docker kill ${DPID}

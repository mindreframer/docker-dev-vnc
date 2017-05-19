build:
	docker build \
		-f Dockerfile \
		-t mindreframer/docker-dev-nomachine-ubuntu \
		.


start:
	docker run \
		-d \
		-p 6000:4000 \
		--cap-add=SYS_PTRACE \
		mindreframer/docker-dev-nomachine-ubuntu



DPID:=$(shell docker ps|grep docker-dev-nomachine-ubuntu|awk '{print $$1}')

kill:
	docker kill ${DPID}

.PHONY: docker-local server
all: server docker-local

server:
	@CGO_ENABLED=0 GOOS=linux go build -a --ldflags '-extldflags "-static"' \
		-tags "netgo" -installsuffix netgo \
		-o server

docker-local: server
	docker build -t rinormaloku/passthrough-grpc-service-example .

docker-push:
	docker push rinormaloku/passthrough-grpc-service-example

clean:
	@rm -fr server

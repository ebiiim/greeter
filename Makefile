all: build-protobuf build-client build-server

build-protobuf:
	protoc -I./grpc/ --go_out=plugins=grpc:. --go_opt=module=github.com/ebiiim/greeter ./grpc/*.proto

build-client:
	go build "-ldflags=-s -w" -trimpath -o dist/client client/main.go

build-server:
	go build "-ldflags=-s -w" -trimpath -o dist/server server/main.go

.PHONY: build-protobuf build-client build-server

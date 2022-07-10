SHELL := /bin/bash


proto:
	protoc \
		--go_out=$(GOPATH)/src \
		--go_opt=paths=import \
		--go-grpc_out=$(GOPATH)/src \
		--go-grpc_opt=paths=import \
		third_party/google/api/annotations.proto \
		third_party/google/api/http.proto \
		security/salt_hash/datastore/v1/salt_hash.proto


gateway:
	protoc \
		--go_out=$(GOPATH)/src \
		--go_opt=paths=import \
		--grpc-gateway_out=logtostderr=true:$(GOPATH)/src \
		security/salt_hash/datastore/v1/salt_hash.proto

compile: proto gateway

.PHONY: compile
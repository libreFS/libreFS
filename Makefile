# Makefile — Docker-based development wrapper
# All dev tasks run inside Docker. No Go toolchain or other tools required on the host.
#
# Quick start:
#   make image      — build the dev Docker image (required once, or after Dockerfile.dev changes)
#   make build      — compile the librefs binary
#   make test       — run all unit tests
#   make verifiers  — run linters and code-gen checks
#   make run        — start the server (S3 on :9000, console on :9001)
#   make clean      — remove build artifacts
#
# The underlying build targets (used inside the container) live in Makefile.local.

DEV_IMAGE           ?= librefs-dev:latest
DATA_DIR            ?= /tmp/librefs-data
MINIO_ROOT_USER     ?= admin
MINIO_ROOT_PASSWORD ?= password

DOCKER_RUN := docker run --rm \
	-v "$(CURDIR)":/app \
	-w /app \
	$(DEV_IMAGE)

.PHONY: all image build test verifiers lint clean run help

all: build

image: ## build the dev Docker image (Dockerfile.dev)
	docker build -t $(DEV_IMAGE) -f Dockerfile.dev .

build: ## compile the librefs binary (inside Docker)
	$(DOCKER_RUN) make -f Makefile.local build

test: ## run all unit tests (inside Docker)
	$(DOCKER_RUN) make -f Makefile.local test

verifiers: ## run linters and code-gen checks (inside Docker)
	$(DOCKER_RUN) make -f Makefile.local verifiers

lint: ## run golangci-lint (inside Docker)
	$(DOCKER_RUN) make -f Makefile.local lint

clean: ## remove generated build artifacts (inside Docker)
	$(DOCKER_RUN) make -f Makefile.local clean

run: build ## start librefs server locally (S3 on :9000, console on :9001)
	@mkdir -p $(DATA_DIR)
	docker run --rm \
		-e MINIO_ROOT_USER=$(MINIO_ROOT_USER) \
		-e MINIO_ROOT_PASSWORD=$(MINIO_ROOT_PASSWORD) \
		-p 9000:9000 \
		-p 9001:9001 \
		-v "$(DATA_DIR)":/data \
		-v "$(CURDIR)":/app \
		-w /app \
		$(DEV_IMAGE) \
		./librefs server /data --console-address :9001

help: ## print this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'


IMAGE_TAG?=unstable

all: buildkite container

container:
	docker build -t getnelson/build-env:$(IMAGE_TAG) $(PWD)

buildkite:
	packer build -on-error=cleanup packer.json

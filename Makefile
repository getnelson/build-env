
IMAGE_TAG?=unstable

all:
	docker build -t getnelson/build-env:$(IMAGE_TAG) $(PWD)

buildkite:
	packer build -on-error=cleanup packer.json

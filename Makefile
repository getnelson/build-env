
IMAGE_TAG?=unstable

all:
	docker build -t getnelson/nelson-build-environment:$(IMAGE_TAG) $(PWD)

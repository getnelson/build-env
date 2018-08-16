
IMAGE_TAG?=unstable

all: buildkite container

container:
	docker build -t getnelson/build-env:$(IMAGE_TAG) $(PWD)

buildkite:
	packer build -on-error=cleanup packer.json

encrypt:
	ansible-vault \
	--vault-password-file="${HOME}/.nelson-build-vault" \
	encrypt --output=local.yml.encrypted \
	local.yml

decrypt:
	ansible-vault \
	--vault-password-file="${HOME}/.nelson-build-vault" \
	decrypt --output=local.yml \
	local.yml.encrypted

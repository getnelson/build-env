#!/usr/bin/env bash

set -e

HUGO_VERSION="0.48"

wget "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz" -O /tmp/hugo.tgz
tar xvf /tmp/hugo.tgz -C /tmp
mv /tmp/hugo /usr/local/bin
chmod +x /usr/local/bin/hugo

#!/usr/bin/env bash

set -e

wget https://github.com/gohugoio/hugo/releases/download/v0.22.1/hugo_0.22.1_Linux-64bit.tar.gz -O /tmp/hugo.tgz
tar xvf /tmp/hugo.tgz -C /tmp
mv /tmp/hugo /usr/local/bin
chmod +x /usr/local/bin/hugo
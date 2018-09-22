#!/bin/bash

set -e

DO_VERSION=1.9.0

wget "https://github.com/digitalocean/doctl/releases/download/v${DO_VERSION}/doctl-${DO_VERSION}-linux-amd64.tar.gz" -O /tmp/doctl.tar.gz

tar xvf /tmp/doctl.tar.gz -C /tmp

mv /tmp/doctl /usr/local/bin

chmod +x /usr/local/bin/doctl

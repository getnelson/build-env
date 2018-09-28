#!/bin/bash

set -e

apt-get update

apt-get install -y \
    apt-transport-https \
    ca-certificates \
    sudo \
    wget \
    curl \
    software-properties-common \
    git \
    telnet \
    iproute2

#!/usr/bin/env bash

set -e

add-apt-repository ppa:openjdk-r/ppa
apt-get update
apt-get install -y openjdk-8-jdk
update-alternatives --config java
java -version

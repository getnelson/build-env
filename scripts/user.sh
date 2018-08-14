#!/usr/bin/env bash

set -e

BUILD_USER="$1"

groupadd -g 1100 "${BUILD_USER}"
useradd -r -u 1100 -g "${BUILD_USER}" "${BUILD_USER}"
usermod -a -G tty "${BUILD_USER}"
usermod -L "${BUILD_USER}"

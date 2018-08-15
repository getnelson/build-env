#!/usr/bin/env bash

set -e

BUILD_USER="$1"

groupadd -g 998 "${BUILD_USER}"
useradd -r -u 999 -g "${BUILD_USER}" "${BUILD_USER}"
usermod -a -G tty "${BUILD_USER}"
usermod -L "${BUILD_USER}"

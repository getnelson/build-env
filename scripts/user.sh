#!/usr/bin/env bash

set -e

BUILD_USER="$1"
HOME_DIR="/home/${BUILD_USER}"

groupadd -g 998 "${BUILD_USER}"

useradd -r -u 999 -g "${BUILD_USER}" --home "${HOME_DIR}" "${BUILD_USER}"
usermod -a -G tty "${BUILD_USER}"
usermod -L "${BUILD_USER}"

mkdir -p "${HOME_DIR}"
chown -R "${BUILD_USER}:${BUILD_USER}" "/home/${BUILD_USER}"

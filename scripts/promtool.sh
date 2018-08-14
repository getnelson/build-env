#!/usr/bin/env bash

set -e

wget https://raw.githubusercontent.com/getnelson/nelson/master/bin/install-promtool -O /tmp/install-promtool

chmod +x /tmp/install-promtool

/tmp/install-promtool

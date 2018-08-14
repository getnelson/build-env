#!/usr/bin/env bash

set -e

wget https://raw.githubusercontent.com/paulp/sbt-extras/master/sbt -O /tmp/sbt
mv /tmp/sbt /usr/local/bin/sbt
chmod +x /usr/local/bin/sbt

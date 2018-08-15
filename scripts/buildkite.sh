#!/bin/bash

set -e

# add the buildkite repository
sh -c 'echo deb https://apt.buildkite.com/buildkite-agent stable main > /etc/apt/sources.list.d/buildkite-agent.list'

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 32A37959C2FA5C3C99EFBC32A79206696452D198

# execute the install
apt-get update

apt-get install -y buildkite-agent

systemctl daemon-reload

systemctl enable buildkite-agent

#!/usr/bin/env bash

set -e
set -x

# enable remote api
cat > /tmp/docker-tcp.socket <<EOF
[Unit]
Description=Docker Socket for the API

[Socket]
ListenStream=2375
BindIPv6Only=both
Service=docker.service

[Install]
WantedBy=sockets.target
EOF

mv /tmp/docker-tcp.socket /lib/systemd/system/docker-tcp.socket

systemctl daemon-reload

systemctl enable docker-tcp.socket

systemctl stop docker

systemctl start docker-tcp.socket

systemctl start docker

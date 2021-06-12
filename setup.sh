#!/usr/bin/env bash

set -exu

# Prep
sudo apt-get update
sudo apt-get install -y curl gnupg software-properties-common

# Add Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

sudo apt-get update
sudo apt-get install -y docker-ce

# Configure docker
mkdir -p /etc/systemd/system/docker.service.d/
cat << EOF > /etc/systemd/system/docker.service.d/override.conf
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:2375 -H fd:// --containerd=/run/containerd/containerd.sock

EOF

# Finish and clean up
sudo apt-get clean
sudo systemctl daemon-reload
sudo systemctl enable docker
sudo systemctl restart docker

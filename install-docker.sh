#!/usr/bin/env bash
sudo apt-get update
sudo apt install apt-transport-https software-properties-common ca-certificates -y
sudo apt-get install -y python
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ubuntu

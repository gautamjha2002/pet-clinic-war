#!/bin/bash
sudo yum update -y # updating packages

# uninstalling old version
sudo yum -y remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

# setting up repository
sudo yum install -y yum-utils

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

# installing docker 

sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# enabling docker
sudo systemctl enable docker

# Starting Docker
sudo systemctl start docker
#!/bin/bash

# docker deps
sudo apt install -y -q btrfs-tools libsystemd-dev apparmor debhelper dh-apparmor dh-systemd libapparmor-dev libdevmapper-dev libltdl-dev libsqlite3-dev pkg-config

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# docker key
if [ ! -f /etc/apt/sources.list.d/docker.list ]; then
    sudo apt update -y -q && sudo apt-cache policy docker-ce
    sudo apt install -y -q  docker-ce
fi


# docker-compose
if [ ! -f /usr/local/bin/docker-compose ]; then
    curl -L https://github.com/docker/compose/releases/download/1.24.1/docker-compose-`uname -s`-`uname -m` -o docker-compose
    chmod +x docker-compose
    sudo mv docker-compose /usr/local/bin/docker-compose
fi


# docker-machine
if [ ! -f /usr/local/bin/docker-machine ]; then
    curl -L "https://github.com/docker/machine/releases/download/v0.16.1/docker-machine-$(uname -s)-$(uname -m)" -o docker-machine
    chmod +x docker-machine
    sudo mv docker-machine /usr/local/bin/docker-machine
fi


# add vagrant to docker for dockering
# https://stackoverflow.com/questions/48568172/docker-sock-permission-denied
sudo usermod -aG docker $(whoami)

## not perfect, but makes it work - otherwise throws permission error on docker.sock
sudo chmod 777 /var/run/docker.sock

sudo systemctl status docker

# above may fail, wipe and re-run
# `docker rm -f $(docker ps -aq)`

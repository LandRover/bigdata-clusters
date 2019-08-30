#!/bin/bash

set -e
set -u
set -x

export DEBIAN_FRONTEND=noninteractive
export VHOME=/home/${USER}
export VAGRANT=/vagrant

sudo apt update -y -q
sudo apt install -y -q  build-essential bash-completion autoconf git curl unison mc
sudo apt install -y -q  apt-transport-https ca-certificates gnupg-agent software-properties-common debconf-utils

source ${VAGRANT}/vagrant/docker.sh

sudo apt autoremove -y -q && sudo apt clean

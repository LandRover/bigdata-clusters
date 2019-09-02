FROM debian:buster

MAINTAINER LandRover

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN apt-get update && apt-get install -q -y  unzip wget curl tar vim ssh net-tools ca-certificates

## allow root login
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22
# CUDA
#
# VERSION       6.5

FROM ubuntu:14.04.1
MAINTAINER Shiquan Wang <shiquanwang@gmail.com>

# Initial apt-get update, upgrade and install
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install build-essential && \
    apt-get -y install software-properties-common

# Install JAVA8
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections && \
    apt-add-repository -y ppa:webupd8team/java && \
    apt-get update &&\
    apt-get -y install oracle-java8-installer && \
    apt-get -y install oracle-java8-set-default && \
    rm -rf /var/cache/oracle-jdk8-installer

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

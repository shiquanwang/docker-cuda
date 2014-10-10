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
    source /etc/profile.d/jdk.sh && \
    rm -rf /var/cache/oracle-jdk8-installer

# Install CUDA package
ADD cuda-repo-ubuntu1404_6.5-14_amd64.deb /tmp/cuda-repo-ubuntu1404_6.5-14_amd64.deb
RUN dpkg -i /tmp/cuda-repo-ubuntu1404_6.5-14_amd64.deb && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install cuda && \
    rm /tmp/cuda-repo-ubuntu1404_6.5-14_amd64.deb

# Post installation
RUN echo 'export PATH=/usr/local/cuda-6.5/bin:$PATH' >> /root/.bashrc && \
    echo '/usr/local/cuda-6.5/lib64' > /etc/ld.so.conf.d/cuda-6.5.conf && \
    ldconfig

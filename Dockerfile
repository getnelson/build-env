FROM ubuntu:bionic

MAINTAINER Nelson Team <team@getnelson.io>

ENV DEBIAN_FRONTEND noninteractive
ENV BUILD_USER builder

# install a bunch of internet boilerplate
RUN apt-get update && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    sudo \
    wget \
    curl \
    software-properties-common

# install promtool
RUN wget https://raw.githubusercontent.com/getnelson/nelson/master/bin/install-promtool -O /tmp/install-promtool && \
    chmod +x /tmp/install-promtool && \
    /tmp/install-promtool

# install hugo
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.22.1/hugo_0.22.1_Linux-64bit.tar.gz -O /tmp/hugo.tgz && \
    tar xvf /tmp/hugo.tgz -C /tmp && \
    mv /tmp/hugo /usr/local/bin && \
    chmod +x /usr/local/bin/hugo

# install a user we'll use for build execution
RUN groupadd -g 1100 "${BUILD_USER}" && \
    useradd -r -u 1100 -g "${BUILD_USER}" "${BUILD_USER}" && \
    usermod -a -G tty "${BUILD_USER}" && \
    usermod -L "${BUILD_USER}"

# install docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable" && \
    apt-get update && \
    apt-get install -y docker-ce=18.06.0~ce~3-0~ubuntu

# install java
RUN add-apt-repository ppa:openjdk-r/ppa && \
    apt-get update && \
    apt-get install openjdk-8-jdk && \
    update-alternatives --config java && \
    java -version

# install sbt
RUN wget https://raw.githubusercontent.com/paulp/sbt-extras/master/sbt -O /tmp/sbt && \
    mv /tmp/sbt /usr/local/bin/sbt && \
    chmod +x /usr/local/bin/sbt

# use the build user when the container runs
USER "${BUILD_USER}"

WORKDIR "/home/${BUILD_USER}"

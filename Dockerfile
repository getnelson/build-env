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
    software-properties-common \
    git \
    telnet \
    iproute2

COPY scripts /scripts/

RUN /scripts/hugo.sh
RUN /scripts/promtool.sh
RUN /scripts/java.sh
RUN /scripts/sbt.sh
RUN /scripts/user.sh "${BUILD_USER}"
RUN /scripts/docker.sh && usermod -aG docker "${BUILD_USER}"
RUN rm -rf /scripts && \
	rm -rf /tmp/* && \
	apt-get clean

# use the build user when the container runs
USER "${BUILD_USER}"

WORKDIR "/home/${BUILD_USER}"

FROM ubuntu:bionic

MAINTAINER Nelson Team <team@getnelson.io>

ENV DEBIAN_FRONTEND noninteractive
ENV BUILD_USER builder

RUN apt-get update && \
	apt-get install -y \
	wget \
	ca-certificates \
	curl \
	sudo

RUN wget https://raw.githubusercontent.com/getnelson/nelson/master/bin/install-promtool -O /tmp/install-promtool && \
	chmod +x /tmp/install-promtool && \
	/tmp/install-promtool

RUN wget https://github.com/gohugoio/hugo/releases/download/v0.22.1/hugo_0.22.1_Linux-64bit.tar.gz -O /tmp/hugo.tgz && \
	tar xvf /tmp/hugo.tgz -C /tmp && \
	mv /tmp/hugo /usr/local/bin && \
	chmod +x /usr/local/bin/hugo

RUN groupadd -g 1100 "${BUILD_USER}" && \
	useradd -r -u 1100 -g "${BUILD_USER}" "${BUILD_USER}" && \
	usermod -a -G tty "${BUILD_USER}" && \
	usermod -L "${BUILD_USER}"

USER "$BUILD_USER"

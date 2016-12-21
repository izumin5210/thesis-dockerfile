FROM openjdk:8-jdk
MAINTAINER Masayuki Izumi <masayuki@izumin.info>

ENV WORKSPACE_DIR /data

RUN apt-get update && \
    apt-get install -y \
        wget \
        texlive-full \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN tlmgr conf updmap --conffile /usr/local/share/texmf/web2c/texmf.cnf \
        shell_escape_commands extractbb,`kpsewhich -var-value=shell_escape_commands`

ENV REDPEN_VERSION 1.7.6
RUN wget https://github.com/redpen-cc/redpen/releases/download/redpen-1.7.6/redpen-$REDPEN_VERSION.tar.gz && \
    tar xvf redpen-$REDPEN_VERSION.tar.gz && \
    cp -av redpen-distribution-$REDPEN_VERSION/* /usr/local/ && \
    rm -rfv redpen-*$REDPEN_VERSION*

WORKDIR $WORKSPACE_DIR
VOLUME $WORKSPACE_DIR

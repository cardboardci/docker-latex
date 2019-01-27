FROM ubuntu:18.04

ENV SCHEME=scheme-basic
ENV TEXLIVE_URL=http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
ENV PATH=/usr/local/texlive/bin/x86_64-linux:$PATH

COPY rootfs/ /
RUN apt-get update -q && apt-get install -qy --no-install-recommends build-essential=12.4ubuntu1 wget=1.19.4-1ubuntu2.1 libfontconfig1=2.12.6-0ubuntu2 && rm -rf /var/lib/apt/lists/*

COPY provision/install.sh /tmp/install.sh
RUN sh /tmp/install.sh && rm -f /tmp/install.sh

ENTRYPOINT []
CMD []
FROM ubuntu:18.04

#
# Build Arguments
#
ENV SCHEME=scheme-basic
ENV TEXLIVE_URL=http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz

#
# Environment Variables
#
ENV PATH=/usr/local/texlive/bin/x86_64-linux:$PATH

#
# Provision
#
COPY rootfs/ /

RUN apt-get update -q
RUN apt-get install -qy build-essential wget libfontconfig1 

COPY provision/install.sh /tmp/install.sh
RUN sh /tmp/install.sh && rm -f /tmp/install.sh

# 
# Options
# 
WORKDIR /media
ENTRYPOINT []
CMD []
FROM ubuntu:18.04

ENV SCHEME=scheme-basic
ENV TEXLIVE_URL=http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
ENV PATH=/usr/local/texlive/bin/x86_64-linux:$PATH

COPY rootfs/ /
RUN apt-get update -q && apt-get install -qy --no-install-recommends build-essential=12.4ubuntu1 wget=1.19.4-1ubuntu2.2 libfontconfig1=2.12.6-0ubuntu2 && rm -rf /var/lib/apt/lists/*

COPY provision/install.sh /tmp/install.sh
RUN sh /tmp/install.sh && rm -f /tmp/install.sh

ENTRYPOINT []
CMD []

##
## Image Metadata
##
ARG build_date
ARG version
ARG vcs_ref
LABEL maintainer = "CardboardCI" \
    \
    org.label-schema.schema-version = "1.0" \
    \
    org.label-schema.name = "latex" \
    org.label-schema.version = "${version}" \
    org.label-schema.build-date = "${build_date}" \
    org.label-schema.release= = "CardboardCI version:${version} build-date:${build_date}" \
    org.label-schema.vendor = "cardboardci" \
    org.label-schema.architecture = "amd64" \
    \
    org.label-schema.summary = "Document typesetting" \
    org.label-schema.description = "LaTeX is a sys­tem for com­puter type­set­ting of doc­u­ments" \
    \
    org.label-schema.url = "https://gitlab.com/cardboardci/images/latex" \
    org.label-schema.changelog-url = "https://gitlab.com/cardboardci/images/latex/releases" \
    org.label-schema.authoritative-source-url = "https://cloud.docker.com/u/cardboardci/repository/docker/cardboardci/latex" \
    org.label-schema.distribution-scope = "public" \
    org.label-schema.vcs-type = "git" \
    org.label-schema.vcs-url = "https://gitlab.com/cardboardci/images/latex" \
    org.label-schema.vcs-ref = "${vcs_ref}" \
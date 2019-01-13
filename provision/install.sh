#!/bin/sh
set -e
cd /tmp/

wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
mkdir install-tl-unx
tar -xvf install-tl-unx.tar.gz -C install-tl-unx --strip-components=1
echo "selected_scheme ${SCHEME}" >> install-tl-unx/texlive.profile
install-tl-unx/install-tl -profile install-tl-unx/texlive.profile
rm -r install-tl-unx
rm install-tl-unx.tar.gz
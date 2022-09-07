#!/bin/bash
# Downloads, compiles, and installs libdwarf.

set -ex

VERSION=0.187
PREFIX=/usr/local

cd /tmp

wget https://fedorahosted.org/releases/e/l/elfutils/$VERSION/elfutils-$VERSION.tar.bz2
tar xvf elfutils-$VERSION.tar.bz2
rm -f elfutils-$VERSION.tar.bz2

cd elfutils-$VERSION

./configure --prefix=$PREFIX --with-zlib --enable-libdebuginfo=dummy || (cat config.log && exit 1)
make -j${CPU_COUNT}
make install

cd ..
rm -rf elfutils-$VERSION


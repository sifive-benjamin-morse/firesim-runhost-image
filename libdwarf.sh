#!/bin/bash
# Downloads, compiles, and installs libdwarf.

set -ex

VERSION=0.4.1
PREFIX=/usr/local

cd /tmp

git clone https://github.com/davea42/libdwarf-code -b 20190110 --depth 1
cd libdwarf-code

autoreconf --install --force

mkdir build
cd build

../configure --enable-shared --disable-static --prefix=$PREFIX --mandir=$PREFIX/man
make
make check
make install

cd ..
rm -rf build

cd ..
rm -rf libdwarf-code

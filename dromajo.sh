#!/bin/bash
# Downloads, compiles, and installs dromajo.

set -ex

cd /tmp

git clone https://github.com/riscv-boom/dromajo --branch main
cd dromajo
git checkout 6a6e34e05e9e023ef7d6ed4711c60758d74ead01

cd src
make
make install
cd ..

cd ..
rm -rf dromajo


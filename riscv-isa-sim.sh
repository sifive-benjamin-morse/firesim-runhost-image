#!/bin/bash
# Downloads, compiles, and installs the Spike ISA Simulator.

set -ex

VERSION=1.1.0

cd /tmp

git clone https://github.com/riscv-software-src/riscv-isa-sim
cd riscv-isa-sim
git checkout v1.1.0
./configure --prefix=/opt/riscv
make -j$(nproc)
make install
cd ..
rm -r riscv-isa-sim

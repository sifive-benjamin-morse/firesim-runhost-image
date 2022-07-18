#!/bin/bash
# Downloads, compiles, and installs the RISC-V test suite.

set -ex

VERSION=1.1.0

cd /tmp

export PATH=/opt/riscv/bin:$PATH

git clone https://github.com/riscv-software-src/riscv-tests
cd riscv-tests
git checkout 3f6063767c4eec2805d2d9f807351bff1a1e9207
git submodule update --init --recursive
./configure --prefix=/opt/riscv/riscv64-unknown-elf
make -j$(nproc)
make install
cd ..
rm -r riscv-tests

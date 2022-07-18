#!/bin/bash
# Downloads, compiles, and installs the RISC-V toolchain.

set -ex

VERSION=1.1.0

cd /tmp

git clone https://github.com/riscv/riscv-gnu-toolchain
cd riscv-gnu-toolchain
git checkout 2022.06.10
./configure --prefix=/opt/riscv --disable-gdb
make
cd ..
rm -r riscv-gnu-toolchain

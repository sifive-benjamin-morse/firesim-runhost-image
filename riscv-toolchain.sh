#!/bin/bash
# Downloads, compiles, and installs the RISC-V toolchain.

set -ex

VERSION=1.1.0

cd /tmp

git clone https://github.com/riscv/riscv-gnu-toolchain
cd riscv-gnu-toolchain
git checkout 2855d823a6e93d50af604264b02ced951e80de67
git submodule update --init --depth 1 riscv-binutils
git submodule update --init --depth 1 riscv-gcc
git submodule update --init --depth 1 riscv-glibc
git submodule update --init --depth 1 riscv-newlib
./configure --prefix=/opt/riscv --with-cmodel=medany --with-arch=rv64gc --disable-gdb
make -j$(nproc)
make linux -j$(nproc)
cd ..
rm -rf riscv-gnu-toolchain

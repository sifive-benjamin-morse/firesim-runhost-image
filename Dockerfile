FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install apt-utils -y
RUN apt-get upgrade -y
RUN apt-get update
RUN apt-get install -y \
  man curl wget unzip tar ca-certificates libtool \
  lsb-release software-properties-common \
  build-essential make ninja-build pkg-config \
  autoconf bc bison flex libfl2 libfl-dev perl libssl-dev \
  git texinfo device-tree-compiler libgmp-dev gawk tree \
  clang-13 clang-format-13 clang-tidy-13 zlib1g-dev

COPY *.sh /tmp/

RUN /tmp/cmake.sh
RUN /tmp/riscv-isa-sim.sh
RUN /tmp/riscv-toolchain.sh
RUN /tmp/riscv-tests.sh
RUN /tmp/verilator.sh

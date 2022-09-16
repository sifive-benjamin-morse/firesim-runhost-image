FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install apt-utils -y
RUN apt-get upgrade -y
RUN apt-get update
RUN apt-get install -y \
  man curl wget unzip tar ca-certificates libtool lsb-release perl git texinfo \
  clang-13 clang-format-13 clang-tidy-13 software-properties-common \
  build-essential make ninja-build pkg-config autoconf bc bison flex \
  device-tree-compiler gawk tree openjdk-17-jdk openjdk-17-jre \
  libfl2 libfl-dev libssl-dev libgmp-dev zlib1g-dev libsqlite3-dev \
  zstd libzstd-dev libcurl4-openssl-dev libmicrohttpd-dev libarchive-dev \
  libdebuginfod-dev

RUN ln -s /usr/bin/clang-13 /usr/bin/clang
RUN ln -s /usr/bin/clang++-13 /usr/bin/clang++
RUN ln -s /usr/bin/clang-tidy-13 /usr/bin/clang-tidy
RUN ln -s /usr/bin/clang-tidy-diff-13.py /usr/bin/clang-tidy-diff
RUN ln -s /usr/bin/clang-format-13 /usr/bin/clang-format
RUN ln -s /usr/bin/clang-format-diff-13 /usr/bin/clang-format-diff
RUN ln -s /usr/bin/git-clang-format-13 /usr/bin/git-clang-format
RUN ln -s /usr/bin/lld-13 /usr/bin/lld
RUN ln -s /usr/bin/lld-13 /usr/bin/ld.lld

COPY *.sh /tmp/

RUN /tmp/scala.sh
RUN /tmp/dromajo.sh
RUN /tmp/cmake.sh
RUN /tmp/libdwarf.sh
RUN /tmp/elfutils.sh
RUN /tmp/riscv-isa-sim.sh
RUN /tmp/riscv-toolchain.sh
RUN /tmp/riscv-tests.sh
RUN /tmp/verilator.sh

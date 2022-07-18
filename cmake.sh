#!/bin/bash
# Downloads and installs CMake.

set -ex

wget https://github.com/Kitware/CMake/releases/download/v3.23.2/cmake-3.23.2-linux-x86_64.sh
chmod +x cmake-3.23.2-linux-x86_64.sh
./cmake-3.23.2-linux-x86_64.sh --skip-license --prefix=/usr
rm cmake-3.23.2-linux-x86_64.sh

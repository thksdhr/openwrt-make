#!/bin/bash

SHELL_PATH=$(readlink -f "${BASH_SOURCE[0]}")
SHELL_DIR=$(dirname ${SHELL_PATH})
echo "SHELL_PATH: ${SHELL_PATH}"
echo "SHELL_DIR: ${SHELL_DIR}"

# 进入源码目录
cd ${SHELL_DIR}/openwrt

# update and install feeds
./scripts/feeds update -a
./scripts/feeds install -a

# config
make menuconfig

# 退出源码目录
cd ${SHELL_DIR}

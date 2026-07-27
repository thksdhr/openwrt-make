#!/bin/bash

SHELL_PATH=$(readlink -f "${BASH_SOURCE[0]}")
SHELL_DIR=$(dirname ${SHELL_PATH})
echo "SHELL_PATH: ${SHELL_PATH}"
echo "SHELL_DIR: ${SHELL_DIR}"
SHELL_TIME=$(date +%Y.%m.%d-%H.%M.%S)

# 进入源码目录
cd ${SHELL_DIR}/openwrt

# update and install feeds
# ./scripts/feeds update -a
# ./scripts/feeds install -a

######################################################################
# 拷贝配置
######################################################################

rm -rf ${SHELL_DIR}/openwrt/files
cp -r ${SHELL_DIR}/files ${SHELL_DIR}/openwrt/

######################################################################
# 开始编译
######################################################################

mkdir -p ${SHELL_DIR}/logs/

(time make world V=s -j$(nproc)) 2>&1 | tee -a ${SHELL_DIR}/logs/${SHELL_TIME}.log

echo "END"

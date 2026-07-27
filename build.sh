#!/bin/bash

SHELL_PATH=$(readlink -f "${BASH_SOURCE[0]}")
SHELL_DIR=$(dirname ${SHELL_PATH})
echo "SHELL_PATH: ${SHELL_PATH}"
echo "SHELL_DIR: ${SHELL_DIR}"
SHELL_TIME=$(date +%Y.%m.%d-%H.%M.%S)

# 自定义环境变量
BuildVersion="v25.12.5"

# 更新包管理器缓存
sudo apt-get update

# 官方推荐安装的依赖
sudo apt-get install -y build-essential clang flex bison g++ gawk \
  gcc-multilib g++-multilib gettext git libncurses5-dev libssl-dev \
  python3-setuptools rsync swig unzip zlib1g-dev file wget

# 打包 iso 需要的依赖
sudo apt-get install -y genisoimage

######################################################################
# 下载 OpenWrt 源码并初始化 feeds
######################################################################

# download and extract OpenWrt source code
git clone https://git.openwrt.org/openwrt/openwrt.git

# 进入源码目录
cd ${SHELL_DIR}/openwrt

# 建立文件夹
mkdir -p files/etc/uci-defaults/

# 切换分支
git checkout ${BuildVersion}

# update and install feeds
./scripts/feeds update -a
./scripts/feeds install -a

######################################################################
# 拷贝配置
######################################################################

cp ${SHELL_DIR}/config ${SHELL_DIR}/openwrt/.config
cp -r ${SHELL_DIR}/files ${SHELL_DIR}/openwrt/

######################################################################
# 开始编译
######################################################################

mkdir -p ${SHELL_DIR}/logs/

(time make world V=s -j$(nproc)) 2>&1 | tee -a ${SHELL_DIR}/logs/${SHELL_TIME}.log

echo "END"

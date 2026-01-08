#!/bin/bash
# Install OpenWrt build dependencies for Ubuntu/Debian (tested on Ubuntu 24.04)

# sudo apt-get update
# sudo apt-get install -y \
#   build-essential clang g++ gcc-multilib g++-multilib pkgconf ccache \
#   autoconf automake libtool cmake ninja-build bc m4 patch fakeroot quilt \
#   file sudo time jq locales \
#   git git-lfs subversion mercurial wget curl rsync unzip \
#   python3 python3-dev python3-pip python3-wheel \
#   libncurses5-dev libncursesw5-dev libncurses-dev zlib1g-dev libssl-dev libelf-dev \
#   libglib2.0-dev libfuse-dev libcap-dev libattr1-dev libdw-dev uuid-dev \
#   liblzma-dev libzstd-dev libbz2-dev libxml2-utils \
#   gettext texinfo gawk flex bison gperf \
#   genisoimage lzop squashfs-tools zstd upx \
#   ecj fastjar java-propose-classpath \
#   perl xsltproc

# 安装依赖

# 官方推荐安装的依赖
sudo apt-get update
sudo apt-get install -y build-essential clang flex bison g++ gawk \
  gcc-multilib g++-multilib gettext git libncurses5-dev libssl-dev \
  python3-setuptools rsync swig unzip zlib1g-dev file wget

# 打包 iso 需要的依赖
sudo apt-get install -y genisoimage


######################################################################
# 下载 OpenWrt 源码并初始化 feeds
######################################################################

# download and extract OpenWrt source code
wget https://github.com/openwrt/openwrt/archive/refs/tags/v24.10.5.tar.gz
tar -zxvf v24.10.5.tar.gz

# 进入源码目录
mv openwrt-24.10.5 openwrt
cd openwrt

# update and install feeds
./scripts/feeds update -a
./scripts/feeds install -a

######################################################################
# 拷贝配置
######################################################################

cp ../config ./.config
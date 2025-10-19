#!/bin/bash
# Install OpenWrt build dependencies for Ubuntu/Debian (tested on Ubuntu 24.04)

sudo apt update
sudo apt install -y \
  # === 基础编译环境 ===
  build-essential clang g++ gcc-multilib g++-multilib pkgconf ccache \
  autoconf automake libtool cmake ninja-build bc m4 patch fakeroot quilt \
  # === 系统与文件工具 ===
  file sudo time jq locales \
  # === 网络与源码管理 ===
  git git-lfs subversion mercurial wget curl rsync unzip \
  # === Python 环境 ===
  python3 python3-dev python3-pip python3-setuptools python3-wheel python3-distutils \
  # === 核心库依赖 ===
  libncurses5-dev libncursesw5-dev libncurses-dev zlib1g-dev libssl-dev libelf-dev \
  libglib2.0-dev libfuse-dev libcap-dev libattr1-dev libdw-dev uuid-dev \
  liblzma-dev libzstd-dev libbz2-dev libxml2-utils \
  # === 文本与构建工具 ===
  gettext texinfo gawk flex bison gperf \
  # === 压缩与镜像工具 ===
  genisoimage lzop squashfs-tools zstd upx \
  # === Java 支持（部分 OpenWrt 工具链需要）===
  ecj fastjar java-propose-classpath \
  # === 其他 ===
  perl xsltproc

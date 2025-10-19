#!/bin/bash
# Install OpenWrt build dependencies for Ubuntu/Debian (tested on Ubuntu 24.04)

sudo apt-get update
sudo apt-get install -y \
  build-essential clang g++ gcc-multilib g++-multilib pkgconf ccache \
  autoconf automake libtool cmake ninja-build bc m4 patch fakeroot quilt \
  file sudo time jq locales \
  git git-lfs subversion mercurial wget curl rsync unzip \
  python3 python3-dev python3-pip python3-wheel python3-distutils \
  libncurses5-dev libncursesw5-dev libncurses-dev zlib1g-dev libssl-dev libelf-dev \
  libglib2.0-dev libfuse-dev libcap-dev libattr1-dev libdw-dev uuid-dev \
  liblzma-dev libzstd-dev libbz2-dev libxml2-utils \
  gettext texinfo gawk flex bison gperf \
  genisoimage lzop squashfs-tools zstd upx \
  ecj fastjar java-propose-classpath \
  perl xsltproc
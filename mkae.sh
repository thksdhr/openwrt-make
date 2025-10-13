#!/bin/bash
# Makefile for OpenWrt
# --- Setup OpenWrt Build Environment ---
BuildVersion="openwrt-24.10"

# install development tools for Ubuntu/Debian
sudo apt update
sudo apt install -y build-essential git-core libncurses5-dev libncursesw5-dev zlib1g-dev \
    gawk flex gettext wget unzip python3 rsync subversion gcc-multilib g++-multilib libssl-dev \
    libelf-dev ecj fastjar java-propose-classpath

# clone OpenWrt source code
git clone https://git.openwrt.org/openwrt/openwrt.git

# change to OpenWrt source directory
cd openwrt || { echo "Failed to change directory to openwrt"; exit 1; }

# checkout a specific branch (optional)
git checkout ${BuildVersion}

# update and install feeds
./scripts/feeds update -a
./scripts/feeds install -a

echo "OpenWrt build environment setup complete."
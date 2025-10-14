#!/bin/bash
# Makefile for OpenWrt
# --- Setup OpenWrt Build Environment ---
BuildVersion="openwrt-24.10.3"

# clone OpenWrt source code
git clone https://git.openwrt.org/openwrt/openwrt.git

# change to OpenWrt source directory
cd openwrt || { echo "Failed to change directory to openwrt"; exit 1; }

# checkout a specific branch (optional)
git checkout ${BuildVersion}

# update and install feeds
./scripts/feeds update -a
./scripts/feeds install -a
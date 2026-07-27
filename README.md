# openwrt-make

wget http://192.168.78.77:60001/openwrt/openwrt-x86-64-generic-ext4-combined-efi.img.gz

gunzip -c ./openwrt-x86-64-generic-ext4-combined-efi.img.gz | dd of=/dev/sda bs=4M

sync

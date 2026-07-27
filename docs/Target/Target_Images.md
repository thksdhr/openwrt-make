# Target Images

---

### 一、 内存与根文件系统归档 (`Root filesystem archives`)

* **`[ ] ramdisk`**：编译内嵌 RAMDisk (Initramfs) 镜像。把整个系统直接塞进内核文件，启动后完全运行在内存中（常用于网络救砖、内存系统）。
* **`[ ] cpio.gz`**：生成 cpio 格式的压缩文件（生成极简 initramfs 使用）。
* **`[*] tar.gz`**：生成 `rootfs.tar.gz` 压缩包（方便直接解压到已有 Linux 分区或 Docker / LXC 容器中）。

---

### 二、 根文件系统类型 (`Root filesystem images`)

* **`[ ] erofs`**：生成 EROFS 高性能只读文件系统（较新的只读文件系统）。
* **`[*] ext4`**：**生成 Ext4 格式镜像**。  
  * **特点**：整个磁盘是标准的单一读写分区。像普通 Linux 一样，扩展磁盘方便，适合大容量 SSD，但**不支持**一键“恢复出厂设置”。
* **`[*] squashfs`**：**生成 Squashfs 格式镜像（OpenWrt 经典模式）**。  
  * **特点**：底层系统是压缩只读的，修改的内容写在 `/overlay` 分区。**最大好处**：系统搞砸后随时可以在终端输入 `firstboot` 命令**一键恢复出厂设置**。

---

### 三、 引导方式与控制台配置 (`GRUB & Serial`)

* **`[*] Build GRUB images`**：生成传统 **Legacy BIOS** 引导镜像（文件名带 `combined.img`），适用于旧电脑或传统 BIOS 模式虚拟机。
* **`[*] Build GRUB EFI images`**：生成 **UEFI** 引导镜像（文件名带 `combined-efi.img`），适用于现代软路由（如 N100、N5105）和开启 UEFI 的虚拟机。
* **`[*] Use Console Terminal`**：开启标准显示器/键盘控制台（连接 HDMI 显示器时能看到命令行输入）。
* **`(115200) Serial port baud rate`**：串口通信波特率（默认 115200，用于工控机串口调试）。
* **`[ ] Use RTE/CTS on serial console`**：串口硬件流控（通常不选）。
* **`() Extra kernel boot options`**：传递给 Linux 内核的额外启动参数（留空即可）。
* **`(5) Seconds to wait before booting`**：开机 GRUB 引导菜单倒计时秒数（默认 5 秒）。
* **`(OpenWrt) Title for the menu entry`**：开机 GRUB 引导菜单显示的标题名称。

---

### 四、 虚拟机格式与压缩打包

* **`[ ] Build LiveCD image (ISO)`**：生成 ISO 光盘镜像（你之前用过的 `openwrt.iso`）。
* **`[ ] Build VirtualBox image files (VDI)`**：自动将镜像打包转换成 VirtualBox 专用的 `.vdi` 虚拟机磁盘。
* **`[ ] Build VMware image files (VMDK)`**：自动转换成 VMware / ESXi 专用的 `.vmdk` 虚拟机磁盘。
* **`[ ] Build Hyper-V image files (VHDX)`**：自动转换成微软 Hyper-V 专用的 `.vhdx` 虚拟机磁盘。
* **`(ttyS0) Serial port device`**：默认串口设备代号。
* **`[*] GZip images`**：自动把编译出来的 `.img` 打包压缩成 `.img.gz`（节省几倍的存储与下载空间）。

---

### 五、 磁盘容量与分区参数 (`Image Options`)

* **`(256) Kernel partition size (in MiB)`**：  
  **内核 / Boot 分区大小**（第一分区，存放内核 `vmlinuz` 和 GRUB 引导）。x86 软路由给 256 MiB 绰绰有余。
* **`(4096) Root filesystem partition size (in MiB)`**：  
  **系统根分区大小**（第二分区）。决定了刷机后 OpenWrt 系统盘的基础总容量（这里你设置的是 **4096 MiB = 4GB**）。
* **`() Root partition on target device`**：显式指定根分区设备路径（留空表示自动识别）。
* **`[ ] Make /var persistent`**：把 `/var` 目录设为持久化保存（OpenWrt 默认 `/var` 在内存中，重启会清空日志。不勾选可以减少磁盘写入开销）。

---

### 💡 最佳推荐配置建议（x86 软路由）

1. 保持 **`ext4`** 和 **`squashfs`** 都勾选，编译时系统会自动各生成一份，你随心选择刷哪个。
2. 保持 **`Build GRUB images`** 和 **`Build GRUB EFI images`** 都勾选，保证传统 BIOS 和 UEFI 都能引导。
3. 勾选 **`GZip images`**，让系统输出 `.img.gz` 压缩包。
4. **根分区大小**（`Root filesystem partition size`）根据你的硬盘设置（一般给 1024 ~ 4096 MiB 足够装大量 Docker 和插件）。
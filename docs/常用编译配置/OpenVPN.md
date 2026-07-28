### 开启 `LuCI` 后台
```
LuCI -> Applications -> <*> luci-app-openvpn
```


### 开启 `OpenVPN`
> `openvpn-mbedtls` 基于 `mbedTLS` 加密库的客户端, 兼容性较差, 体积相对较小
>
> `openvpn-openssl` 基于 `openssl` 加密库的客户端, 兼容性最好, 体积相对较大 
>
> `openvpn-easy-rsa` 生成 OpenVPN CA 及 私钥的工具, 可以不用勾选在其它设备生成密钥复制到  OpenWRT 效果没有区别
```
Network -> VPN -> <*> openvpn-openssl
               -> < > openvpn-mbedtls
               -> <*> openvpn-easy-rsa
```

### 开启 `kmod-tun` + `kmod-ovpn-backports` 内核内核
> 许多 VPN 都依赖 tun 模块, 必须开启
>
> `kmod-ovpn-backports` OpenVPN 的“内核硬件/软件加速包”, 能极大提升 OpenVPN 在路由器上的网速并大幅降低 CPU 占用率， 强烈建议选中
```
Kernel modules -> Network Support -> <*> kmod-ovpn-backports
                                  -> <*> kmod-tun
```
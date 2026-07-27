### 使用 `Nginx` 作为 `OpenWRT` 后台
> 只勾选 luci-nginx, 不要勾选其它web程序, 否则会冲突
```
LuCI -> Collections -> <*> luci-nginx
```
---


### 开启翻译 
> 可以开启多个
```
LuCI -> Modules -> Translations -> <*> Simplified Chinese (zh_Hans)
                                -> <*> Japanese (ja)
```
---


### 开启 dashboard
```
LuCI -> Modules -> <*> luci-mod-dashboard
```

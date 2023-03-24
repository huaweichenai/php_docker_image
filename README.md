# 本地开发PHP基础镜像
---
## 镜像构建
1. 设置构建所需环境变量
```
cp .env-dist .env
```
2. 调整.env内的PHP版本(7.2、7、8)
3. 开始构建
> Debian环境下注意www-data权限问题

```
make build
```

### 国内网络情况下的使用
- 使用网络代理
```
make build proxy=[代理地址 如http://xxx.xxx.xx.xx:xxxx]
```

- 使用国内镜像源（目前仅支持PHP7）
```
make build-internal
```

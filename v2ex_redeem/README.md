# 自动获取 V2EX 每日奖励

## 1 编辑 session_cookie.to_be_edit 文件

找到登录 V2EX 后的 cookie，保存至此文件，并将文件名改为：session_cookie（去掉.to_be_edit）。

## 2 安装依赖

```shell
cd ../cra
bundle install -V
```

## 3 执行脚本

```
ruby v2ex.rb
```
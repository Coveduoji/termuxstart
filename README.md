# Termux 渗透测试工具安装脚本说明

## 一、前置条件

- 已安装 Termux，且网络连接正常。
- 设备存储空间充足，建议至少保留 200MB 以上。
- 脚本会自动安装 Golang、Ruby 等运行环境。

## 二、安装内容

- **micro** — 终端文本编辑器
- **nmap** — 网络端口扫描工具
- **whois** — 域名查询工具
- **curl** / **wget** — 网络下载和请求工具
- **sqlmap** — 自动化 SQL 注入测试工具
- **WhatWeb** — Web 指纹识别工具
- **ffuf** — Go 语言快速 Web 模糊测试工具

## 三、安装方法

1. 复制脚本到 Termux，例如命名为 `setup-tools.sh`。
2. 给予执行权限：
   
   `chmod +x setup-tools.sh`
3. 运行安装脚本：
   `./setup-tools.sh`
4. 安装完成后，建议重新启动 Termux 或执行：
   `source ~/.bashrc`

## 四、使用验证

在终端依次运行以下命令检查工具是否正常安装：

`micro --version`

`nmap --version`

`whois -h`

`curl --version`

`wget --version`

`sqlmap --help`

`whatweb --help`

`ffuf -h`

若显示相关帮助或版本信息，说明安装成功。

## 五、常见问题

* **ffuf** 由 Golang 编译安装，首次安装时可能稍慢。
* 如果某些工具运行报错，请确认网络畅通及依赖已安装。
* 若 `ffuf` 命令不可用，请确认是否已正确设置 PATH：
  `export PATH=$PATH:$HOME/go/bin`

---

感谢使用本安装脚本，祝你渗透测试顺利！如有问题欢迎反馈。

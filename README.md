# termuxstart

# Termux 工具安装脚本说明

## 一、前置条件
1. 已安装 Termux，且网络正常。
2. 设备存储空间充足，建议至少200MB剩余。
3. 脚本中涉及 Golang、Ruby 等环境，会自动安装。

## 二、安装内容
- micro (终端编辑器)
- nmap (端口扫描)
- whois (域名查询)
- curl / wget (网络工具)
- sqlmap (SQL注入工具)
- WhatWeb (Web指纹识别)
- ffuf (Go语言快速模糊测试工具)

## 三、使用验证方法

1. 运行后建议重启 Termux 或执行：
   ```bash
   source ~/.bashrc
   
2.依次执行以下命令查看是否有输出：
   ```bash
   micro --version
   
   nmap --version
   
   whois -h
   
   curl --version
   
   wget --version
   
   sqlmap --help
   
   whatweb --help
   
   ffuf -h

#!/data/data/com.termux/files/usr/bin/bash
set -e

green() { echo -e "\e[1;32m$1\e[0m"; }

INSTALL_DIR="$HOME"
README_FILE="$INSTALL_DIR/readme.txt"

green "📦 更新系统..."
pkg update -y && pkg upgrade -y

green "📥 安装基础工具..."
pkg install -y micro nmap whois curl wget git python ruby golang tmux

green "🐍 安装 sqlmap..."
if [ ! -d "$HOME/sqlmap" ]; then
    git clone --depth=1 https://github.com/sqlmapproject/sqlmap.git "$HOME/sqlmap"
    chmod +x "$HOME/sqlmap/sqlmap.py"
    ln -sf "$HOME/sqlmap/sqlmap.py" "$PREFIX/bin/sqlmap"
    green "✅ sqlmap 安装完成"
else
    green "✅ sqlmap 已存在，跳过"
fi

green "🌐 安装 WhatWeb..."
if [ ! -d "$HOME/WhatWeb" ]; then
    git clone https://github.com/urbanadventurer/WhatWeb.git "$HOME/WhatWeb"
    cd "$HOME/WhatWeb"
    gem install bundler
    bundle config set --local without 'test'
    bundle install
    chmod +x whatweb
    ln -sf "$HOME/WhatWeb/whatweb" "$PREFIX/bin/whatweb"
    green "✅ WhatWeb 安装完成"
else
    green "✅ WhatWeb 已存在，跳过"
fi

green "🛠 安装 ffuf（Go 工具）..."
if ! command -v ffuf &>/dev/null; then
    go install github.com/ffuf/ffuf/v2@latest
    if ! grep -q 'export PATH=$PATH:$HOME/go/bin' ~/.bashrc; then
        echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.bashrc
    fi
    export PATH=$PATH:$HOME/go/bin
    green "✅ ffuf 安装完成"
else
    green "✅ ffuf 已存在，跳过"
fi

green "🎉 所有工具安装完成！"

echo "可用命令: micro, nmap, whois, curl, wget, sqlmap, whatweb, ffuf"

# 生成 readme.txt
cat > "$README_FILE" <<EOF
Termux 工具安装脚本说明

一、前置条件：
1. 已安装 Termux，且网络正常。
2. 设备存储空间充足，建议至少200MB剩余。
3. 脚本中涉及 Golang、Ruby 等环境，会自动安装。

二、安装内容：
- micro (终端编辑器)
- nmap (端口扫描)
- whois (域名查询)
- curl / wget (网络工具)
- sqlmap (SQL注入工具)
- WhatWeb (Web指纹识别)
- ffuf (Go语言快速模糊测试工具)

三、使用验证方法：
1. 运行后建议重启 Termux 或执行：source ~/.bashrc
2. 依次执行以下命令查看是否有输出：
   - micro --version
   - nmap --version
   - whois -h
   - curl --version
   - wget --version
   - sqlmap --help
   - whatweb --help
   - ffuf -h

EOF

green "📄 readme.txt 已生成，路径：$README_FILE"

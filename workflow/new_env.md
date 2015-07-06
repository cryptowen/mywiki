# 新环境设置备忘

## 流程
1. ssh添加公钥
1. 安装各种软件
    1. `oh my zsh`
    1. `tmux`：ubuntu可直接使用`apt-get`，安装的版本支持iterm集成模式
    1. `jenkins`：整个文件夹（包含启动脚本、war文件和目录）移到机器上即可
    1. `gitbook`
    1. python各种包
        - `ipython`
1. 配置iterm快捷启动

```
# 加公钥
cd /root
mkdir .ssh
vi .ssh/authorized_keys

# 设置hostname
hostnamectl set-hostname huwenchao

# 设置timezone
timedatectl list-timezones

# 装软件
apt-get install -y zsh tmux nodejs npm
ln -s /usr/bin/nodejs /usr/bin/node
npm install -g gitbook-cli
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install ipython
```

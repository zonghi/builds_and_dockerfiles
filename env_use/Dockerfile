FROM lvxy/env_static:latest
# 挂载go路径
# zshell 安装
# auto jump 安装
# fzf 安装
# git 环境配置
# vimsrc 安装
RUN echo 'export GOPATH=/root/go' >> ~/.zshrc && \
    yum install -y tmux 
RUN curl -sLf https://spacevim.org/cn/install.sh | bash
WORKDIR /root

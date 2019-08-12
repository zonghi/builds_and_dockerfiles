FROM centos:latest
# 挂载go路径
# zshell 安装
# auto jump 安装
# fzf 安装
# git 环境配置
# vimsrc 安装
########################################################## 资源下载

########################################################## 软件下载
RUN yum install -y epel-release  && \
#安装开发套件
    yum -y groupinstall "Development tools" &&\
    yum install -y \
      #cargo \
      cmake \
      gcc \
      gcc-c++ \
      #default-jdk-headless \
      git \
      golang \
      #libclang-dev \
      #mono-complete \
      #ninja-build \
      #node-typescript \
      npm \
      python34-devel \
      python34 \
      vim \
      zsh
WORKDIR /root
RUN git clone https://github.com/Valloric/ycmd.git /ycmd && \
    git submodule update --init --recursive && \
    rm -rf /ycmd/.git

RUN python3 build.py \
#      --clang-completer \
#      --cs-completer \
      --go-completer 
#      --java-completer \
#      --js-completer \
#      --rust-completer \
#      --system-libclang


########################################################## zsh
RUN chsh -s /bin/zsh \
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
########################################################## golang


########################################################## vimrc


########################################################## fzf


########################################################## auto jump


########################################################## 工作路径



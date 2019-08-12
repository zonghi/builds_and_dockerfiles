FROM centos:6
# 挂载go路径
# zshell 安装
# auto jump 安装
# fzf 安装
# git 环境配置
# vimsrc 安装
RUN    echo 'export LD_LIBRARY_PATH=/root/ffmpeg_build/lib:$LD_LIBRARY_PATH' >> ~/.zshrc && \
    mkdir ~/go && cd ~/go && mkdir bin pkg  && \
    echo 'export GOPATH=/root/go' >> ~/.zshrc && \
    source ~/.zshrc
########################################################## 资源下载

########################################################## 软件下载
RUN yum install -y epel-release  && \
#安装开发套件
    yum -y groupinstall "Development tools" &&\
    yum install -y \
      #cargo \
      cmake \
      gcc \
      sudo \
      ncurses-devel \
      wget \
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
########################################################### zsh
RUN   sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 
########################################################## golang
########################################################## vimrc
########################################################## auto jump
RUN mkdir ~/Download && \
cd ~/Download && \
git clone git://github.com/joelthelion/autojump.git && \
export SHELL=/bin/zsh && \
cd autojump/ && \
python install.py  && \
echo '[[ -s /root/.autojump/etc/profile.d/autojump.sh ]] && source /root/.autojump/etc/profile.d/autojump.sh' >> ~/.zshrc
########################################################### fzf


########################################################## 工作路径

###################################  vimrc
#RUN git clone https://github.com/zonghi/vimcool.git ~/.vimcool && cd ~/.vimcool && bash install.sh && \
###安装vundle
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
## vimsrc 安装
#RUN cd ~/Download && \
#    git clone https://github.com/vim/vim.git && \
#    rm -f /usr/bin/vim* && \
#    cd vim && ./configure -with-features=huge -enable-multibyte -enable-rubyinterp=yes -enable-python3interp=yes -with-python3-config-dir=/usr/lib64/python3.4/config -with-python3-command=/usr/bin/python3 -enable-luainterp=yes -enable-cscope -prefix=/usr/local && \
#    make && make install
#
#RUN vim +BundleInstall +qall 
    
# FFmpeg build section
RUN mkdir ~/ffmpeg_sources

RUN yum -y install autoconf automake cmake freetype-devel gcc gcc-c++ git libtool make mercurial nasm pkgconfig zlib-devel

RUN YASM="1.3.0" && cd ~/ffmpeg_sources && \
    wget http://www.tortall.net/projects/yasm/releases/yasm-$YASM.tar.gz && \
    tar xzvf yasm-$YASM.tar.gz && \
    cd yasm-$YASM && \
    ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin"  && \
    make && \
    make install && \
    make distclean

RUN VPX="1.5.0" && cd ~/ffmpeg_sources && \
    wget http://storage.googleapis.com/downloads.webmproject.org/releases/webm/libvpx-1.5.0.tar.bz2 && \
    tar xjvf libvpx-$VPX.tar.bz2 && \
    cd libvpx-$VPX && \
    PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --disable-examples --disable-unit-tests && \
    PATH="$HOME/bin:$PATH" make && \
    make install && \
    make clean


RUN OPUS="1.3" && cd ~/ffmpeg_sources && \
    wget http://downloads.xiph.org/releases/opus/opus-$OPUS.tar.gz && \
    tar xzvf opus-$OPUS.tar.gz && \
    cd opus-$OPUS && \
    ./configure --help && \
    ./configure --prefix="$HOME/ffmpeg_build"  && \
    make && \
    make install && \
    make clean


RUN X264="20181001-2245-stable" && cd ~/ffmpeg_sources && \
    wget http://download.videolan.org/pub/x264/snapshots/x264-snapshot-$X264.tar.bz2 && \
    tar xjvf x264-snapshot-$X264.tar.bz2 && \
    cd x264-snapshot-$X264 && \
    PATH="$HOME/bin:$PATH" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --enable-static --disable-opencl --disable-asm && \
    PATH="$HOME/bin:$PATH" make && \
    make install && \
    make distclean

RUN FDK_AAC="0.1.4" && cd ~/ffmpeg_sources && \
    wget -O fdk-aac.tar.gz https://github.com/mstorsjo/fdk-aac/archive/v$FDK_AAC.tar.gz && \
    tar xzvf fdk-aac.tar.gz && \
    cd fdk-aac-$FDK_AAC && \
    autoreconf -fiv && \
    ./configure --prefix="$HOME/ffmpeg_build" --disable-shared && \
    make && \
    make install && \
    make distclean


RUN cd ~/ffmpeg_sources && \
    wget http://downloads.xiph.org/releases/ogg/libogg-1.3.2.tar.gz  && \
    tar xzvf libogg-1.3.2.tar.gz && \
    cd libogg-1.3.2 && \
    ./configure --prefix="$HOME/ffmpeg_build" --disable-shared && \
    make && \
    make install && \
    make distclean

RUN cd ~/ffmpeg_sources && \
    wget http://downloads.xiph.org/releases/vorbis/libvorbis-1.3.4.tar.gz && \
    tar xzvf libvorbis-1.3.4.tar.gz && \
    cd libvorbis-1.3.4 && \
    ./configure --prefix="$HOME/ffmpeg_build" --with-ogg="$HOME/ffmpeg_build" --disable-shared && \
    make && \
    make install && \
    make distclean

RUN cd ~/ffmpeg_sources && \
    wget https://johnvansickle.com/ffmpeg/release-source/lame-3.99.5.tar.xz && \
    xz -d lame-3.99.5.tar.xz && \
    tar xvf lame-3.99.5.tar && \
    cd lame-3.99.5 && \
    ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --disable-shared --enable-nasm && \
    make && \
    make install && \
    make distclean


#RUN cd ~/ffmpeg_sources && \
#    wget https://files.pythonhosted.org/packages/6a/f4/4c3d3a2bf950f3261f506284952e23cee2b62e50eb8974aa961228a95e8a/mercurial-4.8.tar.gz && \
#    tar -zxvf mercurial-4.8.tar.gz && \
#    cd mercurial-4.8 && \
#    ln -s ~/ffmpeg_sources/mercurial-4.8/hg /usr/bin/hg

RUN cd ~/ffmpeg_sources && \
    hg clone https://bitbucket.org/multicoreware/x265 && \
    cd x265/build/linux && \
    cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build" -DENABLE_SHARED:bool=off ../../source && \
    make && \
    make install


RUN cd /root/ffmpeg_build/lib && rm -f libopus.so*
RUN git clone https://github.com/zonghi/FFmpeg.git  ffmpeg && \
    cd ffmpeg && \
    export PKG_CONFIG_PATH=/usr/lib64/pkgconfig && \
    PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig:$PKG_CONFIG_PATH" ./configure \
    --prefix="$HOME/ffmpeg_build" \
    --pkg-config-flags="--static" \
    --extra-cflags="-I$HOME/ffmpeg_build/include" \
    --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
    --bindir="$HOME/bin" \
    --enable-gpl \
    --enable-libfdk-aac \
    --enable-libmp3lame \
    --enable-libopus \
    --enable-libx264 \
    --enable-nonfree \
    --enable-avfilter \
    --enable-filters \
    --enable-runtime-cpudetect \
    --enable-pic \
    --enable-static  && \
    PATH="$HOME/bin:$PATH" make && \
    make install && \
    make distclean && \
    hash -r && \
    mv ~/bin/ffmpeg /usr/local/bin/

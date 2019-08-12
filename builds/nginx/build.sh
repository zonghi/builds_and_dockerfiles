#下载
wget http://nginx.org/download/nginx-1.14.0.tar.gz
#解压
tar -xzf nginx-1.14.0.tar.gz
cd nginx-1.14.0

yum -y install gcc pcre pcre-devel zlib zlib-devel openssl openssl-devel

./configure \
--prefix=/usr/local/nginx \
--with-http_ssl_module \
--with-http_stub_status_module \
--with-http_realip_module \
--with-threads

make
make install

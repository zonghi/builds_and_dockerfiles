if [ $# != 1 ] ; then 
echo "USAGE: $0 continerID" 
echo " e.g.: $0 1338c99de113"

exit 1; 
else 
# continer to image

#   重命名现任镜像。
    docker tag centos:now centos:`date +%s`
    docker export $1 > tmp.tar ; cat tmp.tar | docker import - centos:now
# run image 2 continer
    docker rm mylinux
    docker run -it  --name mylinux  \
    -p 10000:80 \
    -p 10001:8888 \
    --mount type=bind,source=/Users/lvxy/go,target=/home/go \
    --mount type=bind,source=/Users/lvxy/code,target=/home/code \
    --mount type=bind,source=/Users/lvxy/data,target=/home/data \
    centos:now \
    /bin/bash  
fi 


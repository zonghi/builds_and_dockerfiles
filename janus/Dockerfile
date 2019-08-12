#清空所有进程
#更改配置文件为debug log
#启动
FROM efacilitation/docker-janus-webrtc-gateway:latest
RUN  rm -f /opt/janus/etc/janus/janus.cfg
COPY conf/*.cfg /opt/janus/etc/janus/

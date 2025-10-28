FROM alpine:latest

WORKDIR /app

# 安装 v2ray 和 nginx
RUN apk add --no-cache wget unzip nginx && \
    wget https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip -O v2ray.zip && \
    unzip v2ray.zip -d /usr/local/bin/ && \
    rm v2ray.zip

# 复制文件
COPY config.json .
COPY nginx.conf .
COPY index.html .

# 暴露端口
EXPOSE 443

# 启动 Nginx + v2ray
CMD nginx && v2ray run -config config.json

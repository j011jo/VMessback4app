FROM alpine:latest

WORKDIR /app

# 安装 v2ray (VMess 核心)
RUN apk add --no-cache wget unzip && \
    wget https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip -O v2ray.zip && \
    unzip v2ray.zip -d /usr/local/bin/ && \
    rm v2ray.zip && \
    apk del wget unzip

# 复制配置文件
COPY config.json .
COPY index.html .

# 暴露端口
EXPOSE 443

# 启动命令
CMD ["v2ray", "run", "-config", "config.json"]

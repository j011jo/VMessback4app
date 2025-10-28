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
COPY start.sh .
RUN chmod +x start.sh

# 暴露端口
EXPOSE 443

# TCP 健康检查 (测试 443 端口开)
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD nc -z 127.0.0.1 443 || exit 1

# 启动脚本
CMD ["./start.sh"]

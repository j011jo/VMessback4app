FROM alpine:latest

WORKDIR /app

# 安装 v2ray
RUN apk add --no-cache wget unzip && \
    wget https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip -O v2ray.zip && \
    unzip v2ray.zip -d /usr/local/bin/ && \
    rm v2ray.zip && \
    apk del wget unzip

COPY config.json .
COPY index.html .

EXPOSE 443

CMD ["v2ray", "run", "-config", "config.json"]

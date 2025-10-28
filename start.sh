#!/bin/bash
echo "Starting Nginx & V2Ray..."
nginx -c /app/nginx.conf &
echo "Nginx PID: $!"
v2ray run -config /app/config.json &
echo "V2Ray PID: $!"
wait

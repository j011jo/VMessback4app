#!/bin/bash
nginx -c /app/nginx.conf &
v2ray run -config /app/config.json &
wait

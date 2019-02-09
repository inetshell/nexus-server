#!/bin/sh

echo "Generating NGINX config file"
export DOLLAR='$'
envsubst < /etc/nginx/conf.d/nexus.template > /etc/nginx/conf.d/nexus.conf

echo "Starting entrypoint"
/scripts/entrypoint.sh

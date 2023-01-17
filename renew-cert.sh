#!/bin/bash

. .env;
if [[ ! -d ./nginx/certbot-webroot ]]; then
    mkdir ./nginx/certbot-webroot;
fi;
docker compose -f docker-compose.yml -f docker-compose.prod.yml run \
    --entrypoint certbot \
    certbot renew -a webroot --webroot-path /var/www;

# Sending a SIGHUP signal to the container using docker container kill --signal=HUP command, 
# will cause the running nginx process inside the container to reload its configuration without 
# needing to restart the container. This can be useful because it allows you to reload the configuration 
# without losing any established connections or in-memory data.
docker container kill --signal=HUP dm-nginx;

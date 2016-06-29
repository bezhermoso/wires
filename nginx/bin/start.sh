#!/bin/bash

[ -d /opt/wireframes/entries ] && echo '' || mkdir /opt/wireframes/entries
[ -d /opt/wireframes/proxies ] && echo '' || mkdir /opt/wireframes/proxies
[ -f /tmp/nginx.pid ] && kill -9 $(cat /tmp/nginx.pid) || echo ''

# There MUST be a better way to do this...
nginx -g "daemon off;" >> /var/log/nginx.log &
pid=$!
echo $pid > /tmp/nginx.pid
tail -F /var/log/nginx.log

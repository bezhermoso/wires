#!/bin/bash

[ -d /opt/wireframes/entries ] && echo '' || mkdir /opt/wireframes/entries
[ -d /opt/wireframes/proxies ] && echo '' || mkdir /opt/wireframes/proxies

nginx -g "daemon off;"

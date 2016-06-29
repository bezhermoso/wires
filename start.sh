#!/bin/bash

echo "Starting nginx..."
service nginx start

if [[ $ENV == 'dev' ]]; then
  CMD="pm2-dev process.yml"
else
  CMD="pm2 process.yml"
fi
echo "Starting app [$CMD]..."

$CMD



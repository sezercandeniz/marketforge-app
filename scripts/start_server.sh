#!/bin/bash
set -e

cd /home/ubuntu/marketforge

pm2 stop all || true
pm2 start server.js
pm2 save

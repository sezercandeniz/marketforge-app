#!/bin/bash
set -e
APP_DIR="/home/ubuntu/marketforge"

cd $APP_DIR

echo "🔐 Klasör sahipliği tekrar garanti altına alınıyor..."
chown -R ubuntu:ubuntu $APP_DIR

export NVM_DIR="/home/ubuntu/.nvm"
export PATH="$PATH:/usr/bin:/usr/local/bin:$NVM_DIR"

echo "📦 node_modules temizleniyor..."
rm -rf node_modules

echo "📦 npm install çalıştırılıyor..."
npm install --unsafe-perm

echo "AfterInstall OK"

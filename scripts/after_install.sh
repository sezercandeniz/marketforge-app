#!/bin/bash
set -e
APP_DIR="/home/ubuntu/marketforge"

cd $APP_DIR

echo "📦 node_modules temizleniyor..."
rm -rf node_modules

# 🟢 NVM Ortamını Yükle
export NVM_DIR="/home/ubuntu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
nvm use stable 

# 📦 npm install çalıştırılıyor
# KRİTİK: İzin hatalarını atlamak için --unsafe-perm kullanıldı.
echo "📦 npm install çalıştırılıyor (Unsafe Perm ile)..."
npm install --unsafe-perm

echo "AfterInstall OK"
#!/bin/bash
set -e
APP_DIR="/home/ubuntu/marketforge"

cd $APP_DIR

echo "📦 node_modules temizleniyor..."
rm -rf node_modules

# 🟢 NVM Ortamını Yükle (NPM yolunu doğru bulmak için kritik)
export NVM_DIR="/home/ubuntu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm use stable # veya kullandığınız spesifik Node versiyonu (ör: nvm use 18)

# 📦 npm install çalıştırılıyor - İzin hatalarını bypass etmek için --unsafe-perm eklendi
echo "📦 npm install çalıştırılıyor..."
npm install --unsafe-perm

echo "AfterInstall OK"
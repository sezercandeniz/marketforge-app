#!/bin/bash
set -e
APP_DIR="/home/ubuntu/marketforge"

cd $APP_DIR

# 🚨 DİKKAT: Sahiplik 'change_ownership.sh' içinde çözüldüyse bu satırı KALDIRIN
# chown -R ubuntu:ubuntu $APP_DIR 

echo "📦 node_modules temizleniyor..."
rm -rf node_modules

# 🟢 NVM Ortamını Yükle (Eğer Node.js'i NVM ile kurduysanız)
export NVM_DIR="/home/ubuntu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # nvm.sh'ı yükle
nvm use stable # Veya kullandığınız node versiyonunu (örneğin nvm use 18)

# 📦 npm install çalıştırılıyor (Artık --unsafe-perm bayrağına gerek yok)
echo "📦 npm install çalıştırılıyor..."
npm install

echo "AfterInstall OK"
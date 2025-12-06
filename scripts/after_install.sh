#!/bin/bash
set -e
APP_DIR="/home/ubuntu/marketforge"

cd $APP_DIR

echo "📦 node_modules temizleniyor (SUDO ile)..."
sudo rm -rf node_modules

# 🟢 KRİTİK DÜZELTME: NVM'i PATH'e Zorlama
export NVM_DIR="/home/ubuntu/.nvm"
# NVM'i PATH'e ekleyen betiği source edin.
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# PATH'e NVM'in ana dizinini ekleyin, nvm komutunu bulabilmek için.
export PATH="$NVM_DIR/versions/node/$(nvm version)/bin:$PATH"

# NVM'i kullan
nvm use stable 

# 📦 Kurulumu SUDO ile yap
echo "📦 npm install SUDO ile çalıştırılıyor..."
# Node'un NVM tarafından belirlenen tam yolunu kullanarak SUDO'yu çalıştırın.
# Bu, SUDO'nun PATH'i sıfırlamasını engeller.
sudo $NVM_DIR/versions/node/$(nvm version)/bin/npm install --unsafe-perm

# 🚨 Kurulum sonrası sahiplik geri alınıyor
echo "🚨 Kurulum sonrası dosya sahipliği ubuntu'ya geri alınıyor..."
sudo chown -R ubuntu:ubuntu $APP_DIR

echo "AfterInstall OK"
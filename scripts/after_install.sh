#!/bin/bash
set -e
APP_DIR="/home/ubuntu/marketforge"

cd $APP_DIR

echo "📦 node_modules temizleniyor..."
rm -rf node_modules

# 🟢 NVM Ortamını Yükle (Path'i doğru ayarlamak için)
export NVM_DIR="/home/ubuntu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
nvm use stable 

# 📦 KRİTİK: Kurulumu SUDO ile yap (Gerekli izinleri atlamak için)
echo "📦 npm install SUDO ile çalıştırılıyor..."
# npm install'i sudo ile çalıştırıp --unsafe-perm bayrağını kullanın
sudo npm install --unsafe-perm

# 🚨 KRİTİK: Kurulumdan sonra, oluşan dosyaların sahipliğini geri alın!
echo "🚨 Kurulum sonrası dosya sahipliği ubuntu'ya geri alınıyor..."
sudo chown -R ubuntu:ubuntu $APP_DIR

echo "AfterInstall OK"
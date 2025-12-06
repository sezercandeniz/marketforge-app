#!/bin/bash
set -e
APP_DIR="/home/ubuntu/marketforge"

cd $APP_DIR

echo "📦 node_modules temizleniyor (SUDO ile)..."
# 💥 KRİTİK DEĞİŞİKLİK: rm -rf komutunu sudo ile çalıştırın.
sudo rm -rf node_modules

# 🟢 NVM Ortamını Yükle (Path'i doğru ayarlamak için)
export NVM_DIR="/home/ubuntu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
nvm use stable 

# 📦 Kurulumu SUDO ile yap (Önceki çözümümüz)
echo "📦 npm install SUDO ile çalıştırılıyor..."
sudo npm install --unsafe-perm

# 🚨 Kurulumdan sonra, oluşan dosyaların sahipliğini geri alın!
echo "🚨 Kurulum sonrası dosya sahipliği ubuntu'ya geri alınıyor..."
sudo chown -R ubuntu:ubuntu $APP_DIR

echo "AfterInstall OK"
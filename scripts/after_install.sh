#!/bin/bash
set -e
APP_DIR="/home/ubuntu/marketforge"

cd $APP_DIR

# 💥 KALDIRILDI: rm -rf node_modules (Artık BeforeInstall'da)

# 🟢 NVM Ortamını Yükle (Node.js yolu için)
export NVM_DIR="/home/ubuntu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm use stable

# 📦 KRİTİK: Kurulumu SUDO ile yap
echo "📦 npm install SUDO ile çalıştırılıyor..."
sudo npm install --unsafe-perm

# 🚨 KRİTİK: Kurulumdan sonra, oluşan dosyaların sahipliğini geri alın!
echo "🚨 Kurulum sonrası dosya sahipliği ubuntu'ya geri alınıyor..."
sudo chown -R ubuntu:ubuntu $APP_DIR

echo "AfterInstall OK"
#!/bin/bash
set -e
APP_DIR="/home/ubuntu/marketforge"

cd $APP_DIR

echo "📦 node_modules temizleniyor (SUDO ile)..."
sudo rm -rf node_modules

# 🟢 KRİTİK DÜZELTME: NVM Ortamını Sağlamlaştırma
# Bu adımlar, nvm komutunun bulunmasını sağlar.
export NVM_DIR="/home/ubuntu/.nvm"

# NVM yükleme betiğini source edin.
# 'source' yerine '.' (nokta) kullanmak, CodeDeploy betikleri için daha güvenilir bir yöntemdir.
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# NVM'i kullan
nvm use stable 

# 📦 Kurulumu SUDO ile yap (İzin hatalarını çözmek için)
echo "📦 npm install SUDO ile çalıştırılıyor..."
sudo npm install --unsafe-perm

# 🚨 Kurulum sonrası sahiplik geri alınıyor
echo "🚨 Kurulum sonrası dosya sahipliği ubuntu'ya geri alınıyor..."
sudo chown -R ubuntu:ubuntu $APP_DIR

echo "AfterInstall OK"
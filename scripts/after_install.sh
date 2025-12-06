#!/bin/bash
set -e
APP_DIR="/home/ubuntu/marketforge"

cd $APP_DIR

echo "📦 node_modules temizleniyor (SUDO ile)..."
sudo rm -rf node_modules

# 🟢 NVM YÜKLEME VE KULLANMA ADIMLARI ATLANDI!
# Bunun yerine, Node.js'in PATH'ini belirle.
export NVM_DIR="/home/ubuntu/.nvm"

# NVM'in yüklediği Node.js'in bin dizinini PATH'e ekleyerek 'npm' komutunu bul.
# (Bu, nvm use stable komutunun yaptığı işi manuel yapar.)
# NOT: Eğer EC2'nizde sadece bir Node versiyonu kuruluysa (örneğin v18.x.x), 
# bu yolu manuel olarak ayarlamak daha kesin sonuç verir. 
# Örnek: export PATH="$NVM_DIR/versions/node/v18.17.1/bin:$PATH"

# Şimdilik en son kurulan NVM versiyonunu PATH'e ekleyelim:
export NODE_VERSION=$(ls -d $NVM_DIR/versions/node/* | sort -V | tail -n 1)
export PATH="$NODE_VERSION/bin:$PATH"


# 📦 Kurulumu SUDO ile yap
echo "📦 npm install SUDO ile çalıştırılıyor..."
# SUDO, artık NVM'i aramak yerine, PATH'e eklediğimiz npm'i kullanacak.
sudo npm install --unsafe-perm

# 🚨 Kurulum sonrası sahiplik geri alınıyor
echo "🚨 Kurulum sonrası dosya sahipliği ubuntu'ya geri alınıyor..."
sudo chown -R ubuntu:ubuntu $APP_DIR

echo "AfterInstall OK"
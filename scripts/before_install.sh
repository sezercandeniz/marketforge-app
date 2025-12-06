#!/bin/bash
# runas: root olarak çalışmalıdır.
set -e

APP_DIR="/home/ubuntu/marketforge"

echo "🧹 Eski dosyalar siliniyor..."
rm -rf $APP_DIR/*

# 🟢 KRİTİK: NVM ve Node.js Kurulumu
# NVM ve Node.js'i 'ubuntu' kullanıcısı bağlamında kurmak için kullanıcı değiştir.
su - ubuntu <<'EOF'

echo "🔧 NVM ve Node.js kurulumu başlatılıyor..."

# NVM Kurulumu
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# NVM'in doğru yüklenmesi için source et.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Node.js stable sürümünü kur.
nvm install stable

# Kurulan sürümü varsayılan yap.
nvm alias default stable

echo "✅ NVM ve Node.js kurulumu tamamlandı."

EOF

# 🔐 Sahiplik ve izinler (Dosyalar kopyalanmadan önce)
echo "🔐 Sahiplik ayarlanıyor..."
chown -R ubuntu:ubuntu $APP_DIR
chmod -R 755 $APP_DIR

echo "BeforeInstall OK"
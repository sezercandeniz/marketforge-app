#!/bin/bash
set -e

APP_DIR="/home/ubuntu/marketforge"

echo "📁 AfterInstall başladı..."
cd $APP_DIR

# Güvenli sahiplik
chown -R ubuntu:ubuntu $APP_DIR
chmod -R 755 $APP_DIR

# Node PATH düzeltmesi (çok önemli!)
export NVM_DIR="/home/ubuntu/.nvm"
export NODE_PATH="/usr/local/lib/node_modules"
export PATH="$PATH:/usr/bin:/usr/local/bin:$NVM_DIR"

echo "🔍 Node versiyon kontrolü:"
node -v || echo "⚠️ Node bulunamadı — before_install içinde kurulu mu?"

echo "📦 node_modules temizleniyor..."
rm -rf node_modules

echo "📦 Bağımlılıklar yükleniyor..."
npm install --force

echo "AfterInstall tamamlandı."

#!/bin/bash
set -e

echo "🚀 Uygulama başlatılıyor..."

APP_DIR="/home/ubuntu/marketforge"
cd $APP_DIR

# 🟢 NVM'i yükle
export NVM_DIR="/home/ubuntu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# 🔧 NPM prefix/globalconfig hatasını düzelt
nvm use --delete-prefix v25.2.1 --silent

# 🔧 Node sürümünü aktif et
nvm use v25.2.1

echo "🔍 Node versiyonu:"
node -v || echo "Node bulunamadı!"

# 🛑 Eski çalışan server varsa kapat
echo "🛑 Çalışan Node process kontrol ediliyor..."
pkill -f "node server.js" || echo "Aktif process yok."

# 🚀 Sunucuyu arka planda başlat
echo "🌍 Server başlatılıyor..."
nohup node server.js > app.log 2>&1 &

echo "✅ ApplicationStart tamamlandı."

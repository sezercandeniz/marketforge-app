#!/bin/bash
set -e

echo "🚀 Uygulama başlatılıyor..."

APP_DIR="/home/ubuntu/marketforge"
cd $APP_DIR

# 🟢 KRİTİK DÜZELTME: NVM'i PATH'e Zorlama
export NVM_DIR="/home/ubuntu/.nvm"

# NVM'i yükleyen betiği source edin.
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# CodeDeploy'un non-login kabuğunda Node.js'i PATH'e ekle.
# Bu, nvm use stable komutunun yaptığı işi yapar.
export NODE_VERSION=$(ls -d $NVM_DIR/versions/node/* | sort -V | tail -n 1)
export PATH="$NODE_VERSION/bin:$PATH"

# Node path düzeltmesi (artık NVM PATH'i kullanılacak)
export NODE_PATH="/usr/local/lib/node_modules" 
# PATH="$PATH:/usr/bin:/usr/local/bin:$NVM_DIR" satırına artık gerek yok.

# NVM'i kullan (PATH zaten ayarlandığı için bu komut şimdi çalışabilir)
nvm use stable 

echo "🔍 Mevcut node versiyonu:"
node -v || echo "Node bulunamadı!"

# Eğer çalışan server varsa kapat
echo "🛑 Çalışan Node process kontrol ediliyor..."
pkill -f "node server.js" || echo "Aktif process yok."

echo "🌍 Server arka planda başlatılıyor..."
nohup node server.js > app.log 2>&1 &

echo "✅ ApplicationStart tamamlandı."
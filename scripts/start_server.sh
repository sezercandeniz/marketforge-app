#!/bin/bash
set -e

echo "🚀 Uygulama başlatılıyor..."

APP_DIR="/home/ubuntu/marketforge"
cd $APP_DIR

# Node path düzeltmesi
export NVM_DIR="/home/ubuntu/.nvm"
export NODE_PATH="/usr/local/lib/node_modules"
export PATH="$PATH:/usr/bin:/usr/local/bin:$NVM_DIR"

echo "🔍 Mevcut node versiyonu:"
# NVM kullanıyorsanız, buraya nvm use stable eklenmelidir:
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
nvm use stable 

node -v || echo "Node bulunamadı!"

# Eğer çalışan server varsa kapat
echo "🛑 Çalışan Node process kontrol ediliyor..."
pkill -f "node server.js" || echo "Aktif process yok."

# 💥 KALDIRILDI: npm install komutu burada olmamalıdır!

echo "🌍 Server arka planda başlatılıyor..."
nohup node server.js > app.log 2>&1 &

echo "✅ ApplicationStart tamamlandı."
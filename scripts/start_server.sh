#!/bin/bash
set -e

echo "🚀 Uygulama başlatılıyor..."

APP_DIR="/home/ubuntu/marketforge"
cd $APP_DIR

# 🟢 NVM Ortamını Yükle (Standart Yöntem)
# NVM'in BeforeInstall'da kurulduğu varsayılır.
export NVM_DIR="/home/ubuntu/.nvm"

# NVM'i çalıştırabilmek için kritik olan betiği source edin.
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# NVM'i kullan
nvm use stable 

# Node path düzeltmesi (Gerekliyse kalsın, ancak NVM'in yolunu bozabilir)
# export NODE_PATH="/usr/local/lib/node_modules" 

echo "🔍 Mevcut node versiyonu:"
node -v || echo "Node bulunamadı!"

# Eğer çalışan server varsa kapat
echo "🛑 Çalışan Node process kontrol ediliyor..."
pkill -f "node server.js" || echo "Aktif process yok."

echo "🌍 Server arka planda başlatılıyor..."
nohup node server.js > app.log 2>&1 &

echo "✅ ApplicationStart tamamlandı."
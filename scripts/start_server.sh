#!/bin/bash
set -e

echo "🚀 Uygulama başlatılıyor..."

APP_DIR="/home/ubuntu/marketforge"
cd $APP_DIR

# 🟢 NVM Ortamını Yükle (Kurulum BeforeInstall'da yapıldı)
export NVM_DIR="/home/ubuntu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 

# 💥 KRİTİK DÜZELTME: NPM çakışmasını temizle
# nvm use komutundan önce çakışan global ayarları kaldır.
# nvm'in doğru Node sürümünü alabilmesi için bu gereklidir.
nvm use --delete-prefix stable 

nvm use stable 

echo "🔍 Mevcut node versiyonu:"
node -v || echo "Node bulunamadı!"

# Eğer çalışan server varsa kapat
echo "🛑 Çalışan Node process kontrol ediliyor..."
pkill -f "node server.js" || echo "Aktif process yok."

echo "🌍 Server arka planda başlatılıyor..."
nohup node server.js > app.log 2>&1 &

echo "✅ ApplicationStart tamamlandı."
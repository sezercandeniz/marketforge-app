#!/bin/bash
set -e

echo "🚀 Uygulama başlatılıyor..."

APP_DIR="/home/ubuntu/marketforge"
cd $APP_DIR

# 🟢 NVM Ortamını Yükle 
export NVM_DIR="/home/ubuntu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 

# 💥 KRİTİK DÜZELTME: NPM çakışmasını temizle
# Hata mesajında belirtilen işlemi yapar: .npmrc dosyasındaki prefix/globalconfig ayarını kaldırır.
# "stable" yerine loglarda gördüğünüz v25.2.1 gibi bir sürüm de kullanabilirsiniz.
nvm use --delete-prefix stable 

# Şimdi nvm use komutunu güvenle çalıştırın.
nvm use stable 

echo "🔍 Mevcut node versiyonu:"
node -v || echo "Node bulunamadı!"

# Eğer çalışan server varsa kapat
echo "🛑 Çalışan Node process kontrol ediliyor..."
pkill -f "node server.js" || echo "Aktif process yok."

echo "🌍 Server arka planda başlatılıyor..."
nohup node server.js > app.log 2>&1 &

echo "✅ ApplicationStart tamamlandı."
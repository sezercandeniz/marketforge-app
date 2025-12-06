#!/bin/bash
set -e

echo "🚀 Uygulama başlatılıyor..."

cd /home/ubuntu/marketforge

# Önce çalışan process varsa öldür
pkill node || true

echo "🌍 Server arka planda başlatılıyor..."
nohup node server.js > app.log 2>&1 &

echo "ApplicationStart tamamlandı."

#!/bin/bash
set -e

echo "📦 Proje klasörü temizleniyor..."
rm -rf /home/ubuntu/marketforge

echo "📁 marketforge klasörü yeniden oluşturuluyor..."
mkdir -p /home/ubuntu/marketforge
chmod -R 755 /home/ubuntu/marketforge

echo "BeforeInstall tamamlandı."

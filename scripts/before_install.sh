#!/bin/bash
set -e

APP_DIR="/home/ubuntu/marketforge"

echo "📦 Eski uygulama temizleniyor..."

# Sadece proje dosyalarını siliyoruz (klasörün tamamını değil!)
rm -rf $APP_DIR/*

echo "📁 marketforge klasörü kontrol ediliyor..."
mkdir -p $APP_DIR

# CodeDeploy runas ubuntu: bu nedenle owner doğru olmalı
chown -R ubuntu:ubuntu $APP_DIR
chmod -R 755 $APP_DIR

echo "BeforeInstall tamamlandı."

#!/bin/bash
set -e

APP_DIR="/home/ubuntu/marketforge"

echo "🧹 Eski dosyalar siliniyor..."
rm -rf $APP_DIR/*

echo "🔐 Sahiplik ayarlanıyor..."
chown -R ubuntu:ubuntu $APP_DIR
chmod -R 755 $APP_DIR

echo "BeforeInstall OK"

#!/bin/bash
set -e

echo "📁 Proje dizinine gidiliyor..."
cd /home/ubuntu/marketforge

echo "🔧 İzinler ayarlanıyor..."
sudo chown -R ubuntu:ubuntu /home/ubuntu/marketforge
sudo chmod -R 755 /home/ubuntu/marketforge

echo "🔄 Node.js 20 kurulumu kontrol ediliyor..."
NODE_VERSION=$(node -v | grep "20" || true)

if [ -z "$NODE_VERSION" ]; then
  echo "Node.js 20 kurulmamis! Kuruluyor..."
  curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
  sudo apt install -y nodejs
fi

echo "📦 Bağımlılıklar kuruluyor..."
npm install --force

echo "AfterInstall başarıyla tamamlandı."

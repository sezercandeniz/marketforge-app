#!/bin/bash
set -e

# Sahiplik artık BeforeInstall'da ayarlandığı için bu satırları kaldırdık veya sadeleştirdik.
cd /home/ubuntu/marketforge

# Node modules temizle
rm -rf node_modules

# NPM global izinlerini düzelt (artık sudo'ya gerek yok)
chown -R ubuntu:ubuntu /home/ubuntu/.npm

# Uygulama bağımlılıklarını kur (Mutlak yolu kullanıyoruz)
/usr/bin/npm install --legacy-peer-deps
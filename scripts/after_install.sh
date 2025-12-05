#!/bin/bash
set -e

sudo chown -R ubuntu:ubuntu /home/ubuntu/marketforge
cd /home/ubuntu/marketforge

# Node modules temizle
rm -rf node_modules

# NPM izinlerini düzelt (GLOBAL)
# Bu satır genellikle gereksizdir çünkü 'runas: ubuntu' kullanıyorsunuz
# Yine de bırakabilirsiniz.
sudo chown -R ubuntu:ubuntu ~/.npm

# Uygulama bağımlılıklarını mutlak yol ile kur
# HATA BURADAYDI: Sadece 'npm' yerine '/usr/bin/npm' kullanıyoruz
/usr/bin/npm install --legacy-peer-deps
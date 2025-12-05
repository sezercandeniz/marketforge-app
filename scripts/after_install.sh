#!/bin/bash
set -e

sudo chown -R ubuntu:ubuntu /home/ubuntu/marketforge
cd /home/ubuntu/marketforge

# Node modules temizle
rm -rf node_modules

# NPM izinlerini düzelt (GLOBAL)
sudo chown -R ubuntu:ubuntu ~/.npm

# Uygulama bağımlılıklarını kur
npm install --legacy-peer-deps

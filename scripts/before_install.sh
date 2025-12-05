#!/bin/bash
set -e

# Node 20 kurulumu
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

# PM2 kurulumu
sudo npm install -g pm2

sudo mkdir -p /home/ubuntu/marketforge
sudo chown ubuntu:ubuntu /home/ubuntu/marketforge

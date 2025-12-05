#!/bin/bash
set -e

echo ">>> Switching to project folder"
cd /home/ubuntu/marketforge

echo ">>> Fixing ownership"
sudo chown -R ubuntu:ubuntu /home/ubuntu/marketforge

echo ">>> Installing dependencies"
npm install --unsafe-perm=true

echo ">>> After install step completed"

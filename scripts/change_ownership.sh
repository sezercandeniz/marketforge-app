#!/bin/bash
# Uygulama ve NPM önbellek dizinlerinin sahipliğini garanti altına al.

# 1. Uygulama Dizinini Ayarla
chown -R ubuntu:ubuntu /home/ubuntu/marketforge

# 2. NPM önbellek dizinini ve NVM dizinini ayarla
chown -R ubuntu:ubuntu /home/ubuntu/.npm
chown -R ubuntu:ubuntu /home/ubuntu/.nvm
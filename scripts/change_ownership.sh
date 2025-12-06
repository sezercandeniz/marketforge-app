#!/bin/bash
# CodeDeploy: runas: root olarak çalışır.

APP_DIR="/home/ubuntu/marketforge"

# Uygulama ve NPM önbellek dizinlerinin sahipliğini garanti altına al.
chown -R ubuntu:ubuntu $APP_DIR
chown -R ubuntu:ubuntu /home/ubuntu/.npm
chown -R ubuntu:ubuntu /home/ubuntu/.nvm

# ubuntu kullanıcısının yazma izinlerini (chmod 775) garantile.
chmod -R u+rwx,g+rwx $APP_DIR
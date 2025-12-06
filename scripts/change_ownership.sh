#!/bin/bash
# Uygulama dizininin (ve içindeki her şeyin) sahipliğini ubuntu kullanıcısına ver.
# Bu komut, appspec'te 'runas: root' olarak çalıştığı için başarılı olacaktır.
sudo chown -R ubuntu:ubuntu /home/ubuntu/marketforge
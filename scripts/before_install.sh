#!/bin/bash
sudo systemctl stop marketforge || true
rm -rf /home/ubuntu/marketforge
mkdir -p /home/ubuntu/marketforge

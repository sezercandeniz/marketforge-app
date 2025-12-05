#!/bin/bash
echo "⏳ Stopping existing app (if any)..."
pm2 stop all || true
rm -rf /home/ubuntu/marketforge

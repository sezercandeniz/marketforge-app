#!/bin/bash
cd /home/ubuntu/marketforge
echo "🚀 Starting app with PM2..."
pm2 start server.js

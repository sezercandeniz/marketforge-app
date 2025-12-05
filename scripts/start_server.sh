#!/bin/bash
echo "Starting server..."
cd /home/ubuntu/marketforge
nohup node server.js > app.log 2>&1 &

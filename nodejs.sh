#!/bin/bash

# Install nodejs

cd ~

mkdir -p installNodejsTemp
cd installNodejsTemp

PROCESS_TYPE=$(uname -m)

NODEJS_LINK='https://nodejs.org/dist/v10.15.0/node-v10.15.0-linux-x64.tar.xz'

if [[ $PROCESS_TYPE = armv6* ]]; then
  NODEJS_LINK='https://nodejs.org/dist/v10.15.0/node-v10.15.0-linux-armv6l.tar.xz'
fi

if [[ $PROCESS_TYPE = armv7* ]]; then
  NODEJS_LINK='https://nodejs.org/dist/v10.16.3/node-v10.16.3-linux-armv7l.tar.xz'
fi

wget $NODEJS_LINK -O node-v10.tar.xz
mkdir -p node-v10
tar xf node-v10.tar.xz -C node-v10 --strip-components=1
cd node-v10
sudo cp -R * /usr/local/

# Install PM2
sudo npm install -g pm2

# Install http-server
sudo npm install -g http-server

# Remove temporatory folder
cd ~
rm -rf installNodejsTemp

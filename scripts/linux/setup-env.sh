#!/bin/bash

sudo mkdir -p /opt/<%= appName %>/
sudo mkdir -p /opt/<%= appName %>/config
sudo mkdir -p /opt/<%= appName %>/tmp

sudo chown ${USER} /opt/<%= appName %> -R
sudo chown ${USER} /etc/init
sudo chown ${USER} /etc/

sudo npm install -g forever userdown wait-for-mongo node-gyp

# fix faulty mongodb bson dependency
cd /opt/nodejs/lib/node_modules/wait-for-mongo/node_modules/mongodb/node_modules/bson/build/Release
sudo ln -s ../../browser_build/bson.js .

# Creating a non-privileged user
sudo useradd meteoruser || :

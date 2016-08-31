#!/usr/bin/env bash
set -ev

apt-get -qq update
apt-get -qq upgrade

# curl to check urls
# software-properties-common to add new repos
# build-essential to build node modules
# imagemagick for image manipulation
# mongodb to track metadata
apt-get -qq -y install curl software-properties-common build-essential imagemagick mongodb

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs

# grunt-cli to build projects and watch files
# mocha and karma to practice TDD
npm install -qg grunt-cli coffee-script mocha karma


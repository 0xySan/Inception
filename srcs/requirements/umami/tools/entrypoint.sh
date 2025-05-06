#!/bin/sh

set -e

npm install -g yarn

yarn global add pm2

git clone https://github.com/umami-software/umami.git
cd umami
yarn install

echo DATABASE_URL=${DATABASE_URL} > .env

yarn build
pm2 start yarn --name umami -- start
pm2 startup
pm2 save
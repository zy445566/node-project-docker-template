#! /bin/bash 
cd ./thirdpart/nginx
sh ./deploy.sh
cd ../mysql
sh ./deploy.sh
cd ../redis
sh ./deploy.sh
cd ../../
git pull
sudo docker build -t xxx-node-app .
sudo docker stop running-xxx-node-app
sudo docker run -e "NODE_ENV=production" -dit --rm --name running-xxx-node-app -p 3000:3000 xxx-node-app 

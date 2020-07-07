#! /bin/bash 
git pull
sudo docker build -t redis-app .
sudo docker stop running-redis-app
sudo docker run -dit --rm --name running-redis-app -v /home/test/redis-data:/data -p 6379:6379 redis-app
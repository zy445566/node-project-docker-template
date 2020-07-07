#! /bin/bash 
git pull
sudo docker build -t nginx-app .
sudo docker stop running-nginx-app
sudo docker run -dit --rm --name running-nginx-app -p 80:80 -p 443:443 nginx-app
#! /bin/bash 
git pull
sudo docker build -t mysql-app .
sudo docker stop running-mysql-app
sudo docker run --name running-mysql-app -v /home/test/mysql-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD="123456" -d mysql-app
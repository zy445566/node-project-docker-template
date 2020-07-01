#! /bin/bash 
# 服务列表
pm2 start app/server1.js
pm2 start app/server2.js
pm2 start app/server3.js
# 主服务
pm2 start app/api.js -i 4
# 使docker常驻
while :;do 
sleep 300
done
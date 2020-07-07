FROM redis:latest
CMD [ "redis-server", "--appendonly","yes","--requirepass","123456"]
# 切换目录
# cd ./thirdpart/redis
# 构建和运行
# docker build -t redis-app .
# docker run -dit --rm --name running-redis-app -v /home/test/redis-data:/data -p 6379:6379 redis-app
# 进入容器
# docker exec -it running-redis-app bash
# 停止容器
# docker stop running-redis-app
# 查看日志
# docker logs running-redis-app

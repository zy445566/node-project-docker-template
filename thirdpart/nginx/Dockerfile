FROM nginx:latest

# 复制配置文件
COPY nginx.conf /etc/nginx/nginx.conf
COPY vhost /etc/nginx/vhost
COPY cert /etc/nginx/cert

# 配置端口
EXPOSE 443
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
# 切换目录
# cd ./thirdpart/nginx
# 构建和运行
# docker build -t nginx-app .
# docker run -dit --rm --name running-nginx-app -p 80:80 -p 443:443 nginx-app
# 进入容器
# docker exec -it running-nginx-app bash
# 停止容器
# docker stop running-nginx-app
# 查看日志
# docker logs running-nginx-app

# 镜像集成，也可以直接使用latest,目前最新为8
FROM centos:latest

# 安装依赖
RUN yum -y update  
RUN yum -y install wget gcc

# 安装node环境
ENV NODE_VERSION v12.18.1
RUN mkdir -p /node/$NODE_VERSION
RUN wget https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-linux-x64.tar.gz
RUN tar xzf node-$NODE_VERSION-linux-x64.tar.gz -C /node/
ENV PATH  /node/node-$NODE_VERSION-linux-x64/bin:$PATH

WORKDIR /app

# 这步必须比复制文件前，如果package.json一样就不会重新安装项目依赖了
COPY ./package.json /app

# 安装项目依赖
RUN npm install cnpm -g --registry=https://registry.npm.taobao.org
RUN cnpm install
# 后端依赖
RUN cnpm install pm2 -g
# # 前端依赖
# RUN cnpm install serve -g

# 复制文件(已使用.dockerignore)
COPY . /app

# 进行文件覆盖(如需要)
# RUN cp -rf ./dockerRewrite/* ./

# 构建项目,构建一般是前端需要
# RUN npm run build

# 暴露端口
EXPOSE 3000

# docker入口文件,运行pm2启动
CMD ["pm2","start","app/api.js","-i","4"]
# 构建和运行
# docker build -t xxx-app .
# 其中NODE_ENV=test是测试环境，线上使用NODE_ENV=prod
# docker run -e "NODE_ENV=prod" -dit --rm --name running-xxx-app -p 3000:3000 xxx-app 
# docker stop running-xxx-app
FROM node:20-alpine

# 设置工作目录
WORKDIR /app

# 先单独复制 package 依赖文件（利用 Docker 缓存机制，加速后续构建）
COPY package*.json ./

# 安装依赖（如果不涉及复杂 C++ 原生编译，--production 即可；若不确定可直接使用 npm install）
RUN npm install --production

# 复制其余项目代码
COPY . .

# 声明暴露 3000 端口
EXPOSE 3000

# 启动服务
CMD ["npm", "start"]
FROM node:20-alpine

# 设置工作目录
WORKDIR /app

# 先单独复制 package 依赖文件（利用 Docker 缓存机制，加速后续构建）
COPY package*.json ./

# 构建阶段需要 devDependencies 中的 TypeScript、Tailwind 等工具
RUN npm install

# 复制其余项目代码
COPY . .

# 生成 next start 所需的生产构建产物
RUN npm run build \
	&& npm prune --production

# 声明暴露 3000 端口
EXPOSE 3000

# 启动服务
CMD ["npm", "start"]
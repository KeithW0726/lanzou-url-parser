FROM node:20-alpine

WORKDIR /app

ENV NODE_ENV=production
ENV PORT=3000

# 复制依赖文件并安装生产依赖
COPY package*.json ./
RUN npm install --only=production

# 复制宿主机 Action 刚编译好的 Next.js 产物
COPY .next ./.next

EXPOSE 3000

CMD ["npm", "start"]
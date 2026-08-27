FROM node:20-alpine

WORKDIR /app

ENV NODE_ENV=production
ENV PORT=3000

# 复制生产环境所需的依赖和编译产物
COPY package*.json ./
RUN npm ci --only=production

# 复制 Next.js 构建好的产物和静态资源
COPY .next ./.next
COPY public ./public

EXPOSE 3000

CMD ["npm", "start"]
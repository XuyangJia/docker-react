FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm config set registry https://registry.npm.taobao.org
RUN npm install
COPY public ./public
COPY src ./src
RUN npm run build

FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html

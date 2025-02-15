#STAGE 1
FROM node:20 AS baseImgage

WORKDIR /app
COPY . .
RUN npm install 

RUN npm run build 

#stage2
FROM nginx:alpine AS production

WORKDIR /app

COPY --from=baseImgage /app/build  ./app/usr/share/nginx/html

EXPOSE 80

CMD ["nginx","-g" ,"daemon off;"]

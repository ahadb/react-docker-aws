FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

## /app/build <-- this will have all the build files in the container

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
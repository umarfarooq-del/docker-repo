FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.29.4-trixie
COPY --from=builder /app/build /usr/share/nginx/html
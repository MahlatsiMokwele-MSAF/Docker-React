# Specify Base Image
FROM node:16-alpine as builder

# Install Dependencies
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .

RUN npm run build

FROM nginx
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html
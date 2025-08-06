# Stage 1: Build
FROM node:lts-alpine AS build

WORKDIR /app

RUN npm install -g @angular/cli

COPY package*.json ./

RUN npm ci

COPY . .

RUN ng build --configuration=production

# Stage 2: Serve
FROM nginx:stable-alpine AS production

COPY --from=build /app/dist/angular-conduit /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8282

CMD ["nginx", "-g", "daemon off;"]
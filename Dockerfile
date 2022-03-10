FROM node:16-alpine3.12 as build

RUN apk update && apk add --no-cache curl git jq rsync openssh-client

RUN mkdir -p ~/.ssh && chmod 700 ~/.ssh

RUN curl -L https://github.com/gohugoio/hugo/releases/download/v0.91.1/hugo_0.91.1_Linux-64bit.tar.gz | tar -xz && mv hugo /usr/local/bin/hugo

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

COPY ./ ./

RUN git submodule update --init --recursive

RUN npx gulp build -f gulpfile_prod.js

FROM nginx:alpine

COPY --from=build /app/public/ /usr/share/nginx/html/

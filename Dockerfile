FROM node:16-alpine3.12 as hugo_base

RUN apk update && apk add --no-cache curl git jq rsync openssh-client

RUN mkdir -p ~/.ssh && chmod 700 ~/.ssh

RUN curl -L https://github.com/gohugoio/hugo/releases/download/v0.91.1/hugo_0.91.1_Linux-64bit.tar.gz | tar -xz && mv hugo /usr/local/bin/hugo

FROM hugo_base as build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

COPY ./ ./

RUN git submodule update --init --recursive

FROM build as g_prod

RUN npx gulp build -f gulpfile_prod.js

FROM build as g_dev

RUN npx gulp build -f gulpfile_dev.js

FROM nginx:alpine as web_prod

COPY --from=g_prod /app/public/ /usr/share/nginx/html/

FROM nginx:alpine as web_dev

COPY --from=g_dev /app/public/ /usr/share/nginx/html/

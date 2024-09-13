# Local
FROM klakegg/hugo:0.111.3-ext-alpine as hugo

RUN apk add jq

COPY .git .git

COPY .git* ./

RUN git submodule update --init --recursive

ENTRYPOINT [ "./scripts/run_server.sh" ]

FROM nginx:mainline-alpine as nginx

COPY nginx/default.conf /etc/nginx/conf.d/

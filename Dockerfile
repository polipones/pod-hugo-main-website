# Local
FROM klakegg/hugo:0.101.0-ext-alpine as hugo_local

RUN apk add jq

COPY ./ ./

RUN git submodule update --init --recursive

ENTRYPOINT [ "./scripts/run_server.sh" ]

# Production
FROM klakegg/hugo:0.101.0-ext-alpine-ci AS hugo_prod_build

ARG hugo_env=production
ENV HUGO_ENV=${hugo_env}

RUN apk add jq

COPY ./ ./

RUN git submodule update --init --recursive && \
    ./scripts/fetch_contacts.sh && \
    hugo

# Weird fix for COPY --from not supporting variable expansion
# https://forums.docker.com/t/how-can-i-expand-a-variable-within-a-copy-command-in-the-dockerfile/113538/8
FROM ${base_image} as base_image_for_deploy

FROM nginx:mainline-alpine as hugo_prod_deploy

COPY --from=base_image_for_deploy /src/public /usr/share/nginx/html

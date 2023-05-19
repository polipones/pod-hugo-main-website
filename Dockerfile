# Development
FROM klakegg/hugo:0.101.0-ext-alpine as hugo_dev

RUN apk add jq

COPY ./ ./

RUN git submodule update --init --recursive

ENTRYPOINT [ "./scripts/run_server.sh" ]

# Production
FROM klakegg/hugo:0.101.0-ext-alpine-ci AS hugo_onbuild

ARG hugo_env=production
ENV HUGO_ENV=${hugo_env}

RUN apk add jq

COPY ./ ./

RUN git submodule update --init --recursive && \
    ./scripts/fetch_contacts.sh && \
    hugo

FROM nginx:alpine as hugo_prod

COPY --from=hugo_onbuild /src/public /usr/share/nginx/html

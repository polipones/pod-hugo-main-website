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

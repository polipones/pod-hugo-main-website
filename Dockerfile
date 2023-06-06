# Local
FROM klakegg/hugo:0.101.0-ext-alpine as hugo_local

RUN apk add jq

COPY .git .git

COPY .git* ./

RUN git submodule update --init --recursive

ENTRYPOINT [ "./scripts/run_server.sh" ]

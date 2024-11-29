# Local
FROM klakegg/hugo:0.111.3-ext AS hugo

RUN apt update && apt install jq -y

COPY .git .git

COPY .git* ./

RUN git submodule update --init --recursive

ENTRYPOINT [ "./scripts/run_server.sh" ]

FROM nginx:mainline AS nginx

COPY nginx/default.conf /etc/nginx/conf.d/

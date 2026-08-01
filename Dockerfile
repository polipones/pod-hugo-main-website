# Local
FROM registry01.in.podolee.cz/cache/hugomods/hugo:std-base-0.164.0 AS hugo

RUN apk add --no-cache jq python3

CMD [ "/bin/sh", "-c", "/src/scripts/run_server.sh" ]

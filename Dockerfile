# Local
FROM registry01.in.podolee.cz/cache/hugomods/hugo:std-base-0.144.2 AS hugo

RUN apk update && apk add jq

CMD [ "/bin/sh", "-c", "/src/scripts/run_server.sh" ]

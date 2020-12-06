FROM alpine:3.11

LABEL maintainer="dotburo <code@dotburo.org>"

RUN apk add --no-cache zip rsync mysql-client

COPY ./backup.sh /backup.sh

WORKDIR /backup

RUN chmod +x /backup.sh

ENTRYPOINT ["crond", "-f"]


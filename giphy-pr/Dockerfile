FROM alpine:latest

RUN apk update && apk add --no-cache \
    ca-certificates \
    curl \
    git \
    make \
    gcc \
    musl-dev
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
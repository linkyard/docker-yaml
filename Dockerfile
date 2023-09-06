FROM alpine:3.18
LABEL maintainer="mario.siegenthaler@linkyard.ch"

RUN apk --no-cache add bash
RUN apk --no-cache add --update curl wget ca-certificates
RUN apk --no-cache add jq yq age
RUN apk --no-cache add gnupg
RUN apk add sops --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/


ENV SPRUCE_VERSION 1.27.0
RUN wget https://github.com/geofffranks/spruce/releases/download/v${SPRUCE_VERSION}/spruce-linux-amd64 \
  && chmod a+x spruce-linux-amd64 \
  && mv spruce-linux-amd64 /usr/local/bin/spruce

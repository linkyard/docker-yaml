FROM alpine:3.18
LABEL maintainer="mario.siegenthaler@linkyard.ch"

ENV SOPS_VERSION=v3.9.0
ENV SPRUCE_VERSION=1.27.0

RUN apk --no-cache add --update curl wget ca-certificates
RUN apk --no-cache add bash jq yq age gnupg

RUN curl -LO "https://github.com/getsops/sops/releases/download/${SOPS_VERSION}/sops-${SOPS_VERSION}.linux.amd64" \
  && mv sops-${SOPS_VERSION}.linux.amd64 /usr/local/bin/sops \
  && chmod +x /usr/local/bin/sops

RUN wget https://github.com/geofffranks/spruce/releases/download/v${SPRUCE_VERSION}/spruce-linux-amd64 \
  && chmod a+x spruce-linux-amd64 \
  && mv spruce-linux-amd64 /usr/local/bin/spruce

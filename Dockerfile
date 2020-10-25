FROM alpine:3.12.1
LABEL Glen Stummer <glen@glen.dev>

ENV TFSEC_VERSION=0.34.0
SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
RUN apk add --no-cache --virtual .build-deps \
    zip~=3.0 \
    wget~=1.20.3-r1 \
    curl~=7.69.1 &&\
    wget https://github.com/tfsec/tfsec/releases/download/v${TFSEC_VERSION}/tfsec-linux-amd64 &&\
    chmod +x  tfsec-linux-amd64 &&\
    mv tfsec-linux-amd64 /usr/local/bin/tfsec &&\
    apk del --purge .build-deps

ENTRYPOINT ["/usr/local/bin/tfsec"]
CMD ["tfsec"]

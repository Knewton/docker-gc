FROM gliderlabs/alpine:3.2

ENV DOCKER_VERSION 1.10.1

# We get curl so that we can avoid a separate ADD to fetch the Docker binary, and then we'll remove it
RUN apk --update add bash curl \
  && curl -s https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION} > /bin/docker \
  && chmod +x /bin/docker \
  && apk del curl \
  && rm -rf /var/cache/apk/*

COPY ./docker-gc /docker-gc
COPY ./docker-gc-every-hour /docker-gc-every-hour

VOLUME /var/lib/docker-gc

ENV GRACE_PERIOD_SECONDS 259200

CMD ["/docker-gc-every-hour"]

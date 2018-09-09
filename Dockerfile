FROM ubuntu:latest

ARG BUILD_PHP_VERSION=7.1
ARG BUILD_MODULES="user node http php"

ENV BUILD_PHP_VERSION $BUILD_PHP_VERSION
ENV BUILD_MODULES $BUILD_MODULES
ENV APP_PERMISSION_FILE "/app/local/package.json"
ENV APP_MODULES $BUILD_MODULES
ENV APP_ETC_DIR "/docker/etc/"

ADD ./scripts /docker/scripts
ADD ./etc /docker/etc
RUN chmod -R +x /docker/scripts/* && \
	/docker/scripts/setup && \
	/docker/scripts/cleanup

ENTRYPOINT [ "dumb-init", "--", "/docker/scripts/entry" ]
CMD [ "sudo", "tail", "-F", "-n0", "/var/log/nginx/error.log" ]

USER me:me
WORKDIR /app/local

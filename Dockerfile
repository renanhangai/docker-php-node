FROM ubuntu:latest

ARG BUILD_PHP_VERSION=7.1
ARG BUILD_MODULES="user node http php"

ENV BUILD_PHP_VERSION $BUILD_PHP_VERSION
ENV BUILD_MODULES $BUILD_MODULES
ENV BUILD_PERMISSION_FILE "/var/www/html/index.php"

ADD ./scripts /docker/scripts
ADD ./etc /docker/etc
RUN chmod -R +x /docker/scripts/* && \
	/docker/scripts/setup && \
	/docker/scripts/cleanup

WORKDIR /var/www/html
ENTRYPOINT [ "/docker/scripts/entry" ]
CMD [ "tail", "-f", "/dev/null" ]
USER me:me
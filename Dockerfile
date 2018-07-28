FROM ubuntu:latest

ARG DOCKER_PHP_VERSION=7.1
ARG DOCKER_MODULES="node http php"

ENV DOCKER_PHP_VERSION $DOCKER_PHP_VERSION
ENV DOCKER_MODULES $DOCKER_MODULES

ADD ./scripts /docker/scripts
ADD ./etc /docker/etc
RUN chmod -R +x /docker/scripts/* && \
	/docker/scripts/setup && \
	/docker/scripts/cleanup

ENTRYPOINT [ "/docker/scripts/entry" ]
CMD [ "tail", "-f", "/dev/null" ]
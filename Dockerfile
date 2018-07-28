FROM ubuntu:latest

ARG DOCKER_PHP_VERSION=7.1
ARG DOCKER_MODULES="node http php"
ENV DOCKER_MODULES $DOCKER_MODULES

ADD ./scripts /docker/scripts
RUN chmod -R +x /docker/scripts/* && \
	/docker/scripts/setup

ENTRYPOINT [ "/docker/scripts/entry" ]
CMD [ "tail", "-f", "/dev/null" ]
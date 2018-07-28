FROM ubuntu:latest

ADD ./scripts /docker/scripts
RUN chmod +x /docker/scripts/*

RUN /docker/scripts/setup && \
	/docker/scripts/install-node
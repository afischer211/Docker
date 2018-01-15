FROM jhipster/jhipster:latest
MAINTAINER Alexander Fischer <fischer.alexander@web.de>

USER root

ARG PROXY=""

ENV http_proxy=$PROXY

RUN apt-get install -y unzip wget

VOLUME /home/jhipster/.m2/repository
VOLUME /home/jhipster/.m2/wrapper

ENV http_proxy=""

USER jhipster

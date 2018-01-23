FROM jhipster/jhipster:latest
MAINTAINER Alexander Fischer <fischer.alexander@web.de>

USER root

ARG PROXY=""

ENV http_proxy=$PROXY

RUN apt-get update && apt-get install -y unzip wget && apt-get upgrade -y

VOLUME /home/jhipster/.m2/repository
VOLUME /home/jhipster/.m2/wrapper

COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s /usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat

USER jhipster

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["tail", "-f", "/home/jhipster/generator-jhipster/generators/server/templates/src/main/resources/banner-no-color.txt"]

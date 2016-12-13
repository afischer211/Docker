FROM logstash
MAINTAINER Alexander Fischer <fischer.alexander@web.de>

ENV LOGSTASH_HOME /usr/share/logstash

ARG PROXY=""

ENV INSTALL_HTTP_PROXY=$PROXY

COPY install_plugins.sh /

RUN chmod a+x-w /install_plugins.sh

# Install found plugins and startup logstash
ENTRYPOINT ["/install_plugins.sh"]
CMD ["-e", ""]

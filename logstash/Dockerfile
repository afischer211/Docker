FROM logstash
MAINTAINER Alexander Fischer <fischer.alexander@web.de>

ENV LOGSTASH_HOME /opt/logstash

ARG PROXY=""

ENV http_proxy=$PROXY

COPY install_plugins.sh /

RUN chmod a+x /install_plugins.sh

ENV http_proxy=""

# Install found plugins and startup logstash
ENTRYPOINT ["/install_plugins.sh"]
CMD ["-e", ""]

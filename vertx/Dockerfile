FROM java:8-jdk-alpine
 
MAINTAINER Alexander Fischer <fischer.alexander@web.de>

# Install dev tools: jdk, git etc...
RUN apk add --update wget bash
 

# Install Vert.x
RUN \
  mkdir -p /usr/local/vertx && cd /usr/local/vertx && \
  wget http://dl.bintray.com/vertx/downloads/vert.x-2.1.6.tar.gz -qO - | tar -xz
  
# RUN wget https://bintray.com/artifact/download/vertx/downloads/vert.x-2.1.6.tar.gz && tar -zxf vert.x-2.1.6.tar.gz
ENV VERTX_HOME /usr/local/vertx/vert.x-2.1.6

# Add vertx to the path
ENV PATH $PATH:$VERTX_HOME/bin

RUN mkdir -p /usr/local/src
WORKDIR /usr/local/src

# mountable directory for external storage of sources
VOLUME /usr/local/src

# Expose
EXPOSE 8080

# Run
ENTRYPOINT ["/bin/bash","/usr/local/vertx/vert.x-2.1.6/bin/vertx"]
#CMD []

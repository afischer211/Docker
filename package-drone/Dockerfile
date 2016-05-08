FROM centos:7
MAINTAINER Alexander Fischer <fischer.alexander@web.de>

# import key
RUN yum install -y wget yum-utils
RUN wget http://download.eclipse.org/package-drone/PD-GPG-KEY
RUN rpm --import PD-GPG-KEY

# add repository
COPY config.repo /
RUN yum-config-manager --add-repo=config.repo 

# install the software package
RUN yum update -y && yum install -y org.eclipse.packagedrone.server && yum clean all

ENV PDRONE_HOME=/usr/lib/package-drone-server/

ENV PDRONE_CFG_HOME=/etc/default/

# add the entry-point shellscript
COPY startup_pdrone.sh /
RUN chmod a+x /startup_pdrone.sh

# add the log-configuration with logstash for later activation
COPY logback_logstash.xml $PDRONE_CFG_HOME
COPY logback_file.xml $PDRONE_CFG_HOME

RUN mkdir /storage
RUN mkdir /var/log/package-drone

# set JAVA_OPTS for package-drone
RUN echo 'JAVA_OPTS="$JAVA_OPTS -Dlogback.configurationFile=/etc/default/logback_pdrone.xml"' >> $PDRONE_CFG_HOME/package-drone-server

# patch the configuration for a better mountable folder
RUN echo >> $PDRONE_CFG_HOME/package-drone-server
RUN echo 'DRONE_STORAGE_BASE="/storage"' >> $PDRONE_CFG_HOME/package-drone-server

# mountable directory for external storage of repo-data
VOLUME /storage
VOLUME /var/log/package-drone
VOLUME /var/lib/package-drone-server/cm

# Hostname for logstash
ENV LOGSTASH_HOST=

# Port for logstash
ENV LOGSTASH_PORT=12201

# Package drone is running on port 8080
EXPOSE 8080

# Starting vertx, vertx is added to the PATH above
ENTRYPOINT ["/bin/sh","/startup_pdrone.sh"]
CMD []

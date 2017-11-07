FROM ubuntu:16.04

MAINTAINER Alexander Fischer fischer.alexander@web.de

ARG PROXY=""

ENV http_proxy=$PROXY

#Update ubuntu packages and install tool-packages
RUN apt-get update && \
apt-get -y upgrade && \
apt-get -y install wget unzip tomcat7 curl python libreoffice

#Tomcat
ENV TOMCAT_HOME /usr/share/tomcat7
ENV WEBAPPS_HOME /var/lib/tomcat7/webapps

RUN cd /usr/share/tomcat7 && \
ln -s /etc/tomcat7 conf && \
ln -s $WEBAPPS_HOME/ /usr/share/tomcat7/webapps
#RUN mkdir /tmp/tomcat && ln -s /tmp/tomcat /usr/share/tomcat7/temp
VOLUME /usr/share/tomcat7/logs
VOLUME /var/local/xwiki
VOLUME /usr/share/tomcat7/temp

#PostgreSQL JDBC
RUN wget -q http://jdbc.postgresql.org/download/postgresql-9.3-1102.jdbc4.jar -P $WEBAPPS_HOME/xwiki/WEB-INF/lib/

#Download WAR from xwiki
COPY versionPicker.py /tmp/
RUN \curl -o xwikiVersion.html http://www.xwiki.org/xwiki/bin/view/Download/ && \
python /tmp/versionPicker.py >> /tmp/downloader.sh && \
chmod +x /tmp/downloader.sh && \
sh /tmp/downloader.sh && \
rm -f /xwikiVersion.html /tmp/downloader.sh /tmp/versionPicker.py

#Uncomment some entries in config-files
RUN perl -i -p0e "s/# environment.permanentDirectory/  environment.permanentDirectory/smg" $WEBAPPS_HOME/xwiki/WEB-INF/xwiki.properties
#RUN perl -i -p0e "s/# xwiki.url.protocol=/xwiki.url.protocol=https/smg" $WEBAPPS_HOME/xwiki/WEB-INF/xwiki.cfg
RUN perl -i -p0e "s/# xwiki.authentication.ldap=1/  xwiki.authentication.ldap=1/smg" $WEBAPPS_HOME/xwiki/WEB-INF/xwiki.cfg
COPY ./conf/hibernate.cfg.xml $WEBAPPS_HOME/xwiki/WEB-INF/hibernate.cfg.xml
ENV JAVA_OPTS  -Djava.awt.headless=true

ENV http_proxy=""

#Start
CMD [ "/usr/share/tomcat7/bin/catalina.sh", "run" ]

#Port
EXPOSE 8080

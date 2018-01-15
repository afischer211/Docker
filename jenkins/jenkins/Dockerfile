#use weekly build for jenkins and add some tools
FROM jenkins:latest
#FROM jenkinsci/jenkins:latest
MAINTAINER Alexander Fischer <fischer.alexander@web.de>

USER root

ARG PROXY=""

ENV http_proxy=$PROXY

RUN apt-get update && apt-get install -y git curl zip ruby && apt-get upgrade -y

USER jenkins

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

ENV http_proxy=""

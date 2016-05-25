#use weekly build for jenkins and add some tools
FROM jenkinsci/jenkins
MAINTAINER Alexander Fischer <fischer.alexander@web.de>

USER root

RUN apt-get update && apt-get install -y git curl zip && rm -rf /var/lib/apt/lists/*

USER jenkins
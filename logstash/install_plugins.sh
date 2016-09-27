#!/bin/sh

set -e

# install all detected logstash-plugins
cd $LOGSTASH_HOME
if [ -d /config-dir ]; then
	for plugin in `find /config-dir/ -name *.gem`
	do
	  bin/logstash-plugin install $plugin
	done
fi

/docker-entrypoint.sh $*
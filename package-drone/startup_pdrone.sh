#/bin/sh
echo "Startup of package-drone"

# Patching configuration for logging, database and other
if [ -z "$LOGSTASH_HOST" ]; then
	echo "LOGSTASH_HOST is empty, logging to logstash is disabled"
	cp $PDRONE_CFG_HOME/logback_file.xml $PDRONE_CFG_HOME/logback_pdrone.xml
else
	echo "Logging to logstash-host $LOGSTASH_HOST:$LOGSTASH_PORT enabled"
	# copy and fill alternative logging-configuration
	sed "s|\[logstash-host\]|$LOGSTASH_HOST|g;s|\[logstash-port\]|$LOGSTASH_PORT|g" $PDRONE_CFG_HOME/logback_logstash.xml > $PDRONE_CFG_HOME/logback_pdrone.xml
fi

/usr/lib/package-drone-server/instance/server

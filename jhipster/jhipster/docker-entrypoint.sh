#!/bin/bash
#set -e
set -eo pipefail
if [ -n "$http_proxy" ]; then
 git config --global http.proxy ${http_proxy}
 git config --global url."https://".insteadOf git://
 npm config set proxy ${http_proxy}
 echo Using proxy ${http_proxy}
fi

exec "$@"

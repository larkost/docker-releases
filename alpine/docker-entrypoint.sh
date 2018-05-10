#!/bin/sh
set -e

MITMPROXY_PATH="/home/mitmproxy/.mitmproxy"
MITMPROXY_USER=${MITMPROXY_USER:-mitmproxy}
MITMPROXY_GROUP=${MITMPROXY_GROUP:-mitmproxy}

if [[ "$1" = "mitmdump" || "$1" = "mitmproxy" || "$1" = "mitmweb" ]]; then
        mkdir -p "$MITMPROXY_PATH"
        chown -R $MITMPROXY_USER:$MITMPROXY_GROUP "$MITMPROXY_PATH"

        su-exec $MITMPROXY_USER "$@"
else
        su-exec "$@"
fi

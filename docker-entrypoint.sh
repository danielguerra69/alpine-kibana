#!/bin/sh
set -e
PATH=$PATH":/usr/share/kibana/bin"
# Add kibana as command if needed
if [[ "$1" == -* ]]; then
	set -- kibana "$@"
fi

# Run as user "kibana" if the command is "kibana"
if [ "$1" = 'kibana' ]; then
	if [ "$ELASTICSEARCH_URL" ]; then
		sed -ri "s!^(\#\s*)?(elasticsearch\.url:).*!\2 '$ELASTICSEARCH_URL'!" /usr/share/kibana/config/kibana.yml
	fi
	set -- su - kibana -s /bin/sh -c kibana -- "$@"
fi

exec "$@"

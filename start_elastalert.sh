#!/bin/bash
if ! wget -q -T 3 -O - "http://13.235.255.178:9200/elastalert_status" 2>/dev/null
then
    echo "Creating Elastalert index in Elasticsearch..."
    elastalert-create-index --config /etc/esconfig/config.yaml
else
    echo "Elastalert index already exists in Elasticsearch."
fi

echo "Starting Elastalert..."
exec supervisord -c "/etc/supervisor.conf" -n

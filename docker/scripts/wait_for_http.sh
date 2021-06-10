#!/bin/bash

if [ $# != 1 ]; then
    echo "Usage: wait_for_http.sh <URL>"
    exit 1
fi

url=$1
max_iterations=20
wait_seconds=6
iterations=0

while true
do
    http_code=$(curl -w '%{http_code}' -o /dev/null --max-time 5 --silent --fail -L $url)
    if [ "$http_code" -eq 200 ]; then
        break
    fi

    if [ "$iterations" -ge "$max_iterations" ]; then
        echo "Timeout"
        exit 1
    fi

    ((iterations++))
    echo "Waiting for $url"
    sleep $wait_seconds
done

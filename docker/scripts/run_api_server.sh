if [ $# != 1 ]; then
    echo "Usage: run_api_server.sh <docker_network_name>"
    exit 1
fi

echo "Starting API Server. Docker network: $1"

# ------------------------------------------------------------------------
# Run Docker image
# ------------------------------------------------------------------------

docker run \
  --name=api \
  --network=$1 \
  --rm \
  --detach \
  -p 8080:8080 \
  -v /tmp/build:/build \
  tdddblog/pds_api_server:1.0

# ------------------------------------------------------------------------
# Wait for API server to start
# ------------------------------------------------------------------------

url="localhost:8080"
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

echo "API Server started"

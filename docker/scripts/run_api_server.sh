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

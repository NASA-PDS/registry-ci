if [ $# != 1 ]; then
    echo "Usage: run_es.sh <docker_network_name>"
    exit 1
fi

echo "Starting Elasticsearch. Docker network: $1"

# ------------------------------------------------------------------------
# Run Docker image
# ------------------------------------------------------------------------

docker run \
  --name=elastic \
  --network=$1 \
  --rm \
  --detach \
  -p 9200:9200 \
  -e "discovery.type=single-node" \
  docker.elastic.co/elasticsearch/elasticsearch-oss:7.10.2

# docker network create elastic

docker run \
  --name="elastic" \
  --network=elastic \
  --rm \
  --detach \
  -p 9200:9200 \
  -e "discovery.type=single-node" \
  --health-cmd "curl localhost:9200" \
  --health-interval 10s \
  --health-timeout 5s \
  --health-retries 5 \
  docker.elastic.co/elasticsearch/elasticsearch-oss:7.10.2

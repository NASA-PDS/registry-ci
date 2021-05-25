# docker network create elastic

docker run \
  --name="es01" \
  --network=elastic \
  --rm \
  --detach \
  -p 9200:9200 \
  -e "discovery.type=single-node" \
  docker.elastic.co/elasticsearch/elasticsearch-oss:7.10.2

Docker image to harvest and load test data into Elasticsearch.

Required parameters:
  - You have to mount '/build' directory in a container.
  - You have to pass Elasticsearch URL in 'ES_URL' environment variable.
  - This container and Elasticsearch container should use the same Docker network (--network parameter)

Usage:
  docker run --rm --name registry-load \
  --network elastic \
  -e "ES_URL=http://elastic:9200" \
  -v /tmp/build:/build \
  <DOCKER_IMAGE_NAME>

The container runs following steps:
  - Install Harvest and Registry manager locally in the container (from binary distributions in '/build' directory)
  - Run Harvest to process test data stored in the container
  - Run Registry Manager to create Registry indices in Elasticsearch
  - Run Registry Manager to load data files created by Harvest into Elasticsearch

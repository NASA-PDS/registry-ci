Docker image for running Registry API server.

Required parameters:
  - You have to mount '/build' directory in a container.
  - This container and Elasticsearch container should use the same Docker network (--network parameter)
  - NOTE: Elasticsearch host name "elastic" is hardcoded in '/cfg/application.properties' file. 

Usage:
  docker run \
    --name="api" \
    --network=elastic \
    --rm \
    --detach \
    -p 8080:8080 \
    -v /tmp/build:/build \
    <DOCKER_IMAGE_NAME>

The container runs following steps:
  - Install Registry API server locally in the container (from binary distribution in '/build' directory)
  - Start Registry API server

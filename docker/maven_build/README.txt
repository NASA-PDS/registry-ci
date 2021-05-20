Docker image for building Harvest, Registrt Manager, and Registry API.

To speed up builds, all maven dependency JARs are included in this image.
To change included maven dependency JARs, update POM files in 'pom' directory.

Only one Registry component can be built at a time.
You have to mount '/build' directory in a container.

Usage:
  docker run --rm --name registry-build -v /tmp/build:/build <DOCKER_IMAGE_NAME> harvest
  docker run --rm --name registry-build -v /tmp/build:/build <DOCKER_IMAGE_NAME> manager
  docker run --rm --name registry-build -v /tmp/build:/build <DOCKER_IMAGE_NAME> api

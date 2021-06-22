Docker image for building Harvest, Registrt Manager, and Registry API.

To speed up builds, all maven dependency JARs are included in this image.
To change included maven dependency JARs, update POM files in 'pom' directory.

Required parameters:
  - You have to mount '/build' directory in a container. Built tar.gz files will be copied here.
  - You have to pass one of the following parameters: 'harvest', 'manager', or 'api'.

Usage:
  docker run --rm --name registry-build -v /tmp/build:/build <DOCKER_IMAGE_NAME> harvest
  docker run --rm --name registry-build -v /tmp/build:/build <DOCKER_IMAGE_NAME> manager
  docker run --rm --name registry-build -v /tmp/build:/build <DOCKER_IMAGE_NAME> api

The container runs following steps:
  - Checkout main branch of one of the Registry components (harvest, manager, api)
  - Run maven build
  - Copy generated tar.gz file into '/build' directory.

mkdir -p /tmp/build

docker run \
  --rm \
  --name registry-build \
  -v /tmp/build:/build \
  tdddblog/pds_maven_build:1.0 $1 $2

docker run \
  --name="api" \
  --network=elastic \
  --rm \
  --detach \
  -p 8080:8080 \
  -v /build:/build \
  tdddblog/pds_api_server:1.0

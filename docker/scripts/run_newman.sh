docker run \
  --name=newman \
  --network=elastic \
  --rm \
  -v /build/postman:/etc/newman \
  postman/newman:latest run postman_collection.json 

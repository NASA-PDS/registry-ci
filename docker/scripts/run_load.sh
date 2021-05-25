docker run \
  --rm \
  --name registry-load \
  --network elastic \
  -e "ES_URL=http://es01:9200" \
  -v /build:/build \
  tdddblog/pds_load_test_data:1.0 $1

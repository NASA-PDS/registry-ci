#! /bin/bash -eu

# Check that /build directory is mounted
if [ ! -d "/build/" ]; then
    echo "Error: directory '/build' is not mounted."
    exit 1
fi

# Validate arguments
ERROR="Pass one of the following arguments: 'harvest', 'manager', 'api'."

if [ $# != 1 ]; then
    echo $ERROR
    exit 1
fi

case $1 in
harvest)
    echo "Building Harvest ..."
    git clone https://github.com/NASA-PDS/harvest.git
    cd harvest
    mvn package
    cp target/harvest-*-bin.tar.gz /build
;;
manager)
    echo "Building Registry Manager ..."
    git clone https://github.com/NASA-PDS/pds-registry-mgr-elastic.git
    cd pds-registry-mgr-elastic
    mvn package
    cp target/registry-manager-*-bin.tar.gz /build
;;
api)
    echo "Building Registry API ..."
;;
*)
    echo $ERROR
    exit 1
;;
esac


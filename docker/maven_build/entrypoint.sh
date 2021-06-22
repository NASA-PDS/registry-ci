#! /bin/bash -eu

# Check that /build directory is mounted
if [ ! -d "/build/" ]; then
    echo "Error: directory '/build' is not mounted."
    exit 1
fi

# Validate arguments
ERROR="Usage: entrypoint.sh { harvest | manager | api } [branch]"

if [ $# == 1 ]; then
    BRANCH=main
elif [ $# == 2 ]; then
    BRANCH=$2
else
    echo $ERROR
    exit 1
fi

case $1 in
harvest)
    echo "Building Harvest ..."
    git clone https://github.com/NASA-PDS/harvest.git
    cd harvest
    git checkout $BRANCH
    if [ $? != 0 ]; then exit 1; fi
    mvn package
    cp target/harvest-*-bin.tar.gz /build
;;
manager)
    echo "Building Registry Manager ..."
    git clone https://github.com/NASA-PDS/pds-registry-mgr-elastic.git
    cd pds-registry-mgr-elastic
    git checkout $BRANCH
    if [ $? != 0 ]; then exit 1; fi
    mvn package
    cp target/registry-manager-*-bin.tar.gz /build
;;
api)
    echo "Building Registry API ..."
    git clone https://github.com/NASA-PDS/registry-api-service.git
    cd registry-api-service
    git checkout $BRANCH
    if [ $? != 0 ]; then exit 1; fi
    mvn package
    cp target/registry-api-service-*-bin.tar.gz /build
;;
*)
    echo $ERROR
    exit 1
;;
esac

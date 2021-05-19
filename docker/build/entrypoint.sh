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
;;
manager)
    echo "Building Registry Manager ..."
;;
api)
    echo "Building Registry API ..."
;;
*)
    echo $ERROR
    exit 1
;;
esac


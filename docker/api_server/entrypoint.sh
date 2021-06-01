#! /bin/bash -eu

# Check that /build directory is mounted
if [ ! -d "/build/" ]; then
    echo "Error: directory '/build' is not mounted."
    exit 1
fi

# Check that config file exists
if [ ! -f "/cfg/application.properties" ]; then
    echo "Error: missing '/cfg/application.properties' configuration file."
    exit 1
fi

# ------------------ Create directories ---------------------

mkdir -p /opt

# ---------------------- Install Harvest --------------------

echo "Installing Registry API server ..."

TGZS=($(ls /build/registry-api-service-*-bin.tar.gz))
TGZ=${TGZS[0]}
tar xzf $TGZ -C /opt

# Installation directory
INSTL=($(ls -d /opt/registry-api-service-*))
INSTD=${INSTL[0]}

# Full path to the JAR
JARS=($(ls $INSTD/registry-api-service-*.jar))
JAR=${JARS[0]}

# ------------------------ Run API Server  ------------------

echo "Starting API Server ..."
echo "java -jar $JAR --spring.config.location=file:///cfg/application.properties"

java -jar $JAR --spring.config.location=file:///cfg/application.properties

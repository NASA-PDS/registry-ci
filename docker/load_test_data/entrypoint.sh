#! /bin/bash -eu

# ------- Validate mounts and environment variables ---------

# Check that /build directory is mounted
if [ ! -d "/build/" ]; then
    echo "Error: directory '/build' is not mounted."
    exit 1
fi

# Check that ES_URL environment variable is set
if [ -z "$ES_URL" ]; then
    echo "Error: 'ES_URL' (Elasticsearch URL) environment variable is not set. Use docker's -e option."
    exit 1
fi

# ------------------ Create directories ---------------------

mkdir -p /opt

# ---------------------- Install Harvest --------------------

echo "Installing Harvest ..."

TGZS=($(ls /build/harvest-*-bin.tar.gz))
TGZ=${TGZS[0]}
tar xzf $TGZ -C /opt

INSTL=($(ls -d /opt/harvest-*))
INSTD=${INSTL[0]}
PATH=$PATH:$INSTD/bin
export PATH

# ------------------ Install Registry Manager ---------------

echo "Installing Registry Manager ..."

TGZS=($(ls /build/registry-manager-*-bin.tar.gz))
TGZ=${TGZS[0]}
tar xzf $TGZ -C /opt

INSTL=($(ls -d /opt/registry-manager-*))
INSTD=${INSTL[0]}
PATH=$PATH:$INSTD/bin
export PATH

# -------------------- Harvest test data --------------------

echo "Harvesting test data ..."
harvest -c /cfg/dir1.xml

# ----------- Load test data into Elasticsearch -------------

echo "Loading test data into Elasticsearch ..."
registry-manager create-registry -es $ES_URL
registry-manager load-data -dir /tmp/harvest/out/ -es $ES_URL

# ------- Copy postman test scripts to shared dir -----------

echo "Installing test scripts ..."
cp -R /postman /build/postman

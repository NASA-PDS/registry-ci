#! /bin/bash -eu

# Check that /build directory is mounted
if [ ! -d "/build/" ]; then
    echo "Error: directory '/build' is not mounted."
    exit 1
fi

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

# ------------------ Harvest test data ---------------

echo "Harvesting test data ..."
harvest -c /cfg/dir1.xml

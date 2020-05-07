#! /usr/bin/env bash

user_id=$(id -u)
if [ "${user_id}" != 0 ]; then
    echo "The script needs to be executed by the root user."
    exit 1
fi

DIR=$(dirname $(realpath ${0}))
DIR_SSTP=/etc/ss-tproxy

cp -uf ${DIR}/ss-tproxy /usr/local/bin/
mkdir -p ${DIR_SSTP}
cp -uf ${DIR}/chnroute6.set ${DIR_SSTP}/
cp -uf ${DIR}/chnroute.set ${DIR_SSTP}/
cp -uf ${DIR}/gfwlist.ext ${DIR_SSTP}/
cp -uf ${DIR}/gfwlist.txt ${DIR_SSTP}/
cp -uf ${DIR}/ignlist.ext ${DIR_SSTP}/
cp -uf ${DIR}/ss-tproxy.service /etc/systemd/system/
systemctl daemon-reload
echo "Please link a config file for ${DIR_SSTP}/ss-tproxy.conf"

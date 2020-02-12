#! /usr/bin/env bash

user_id=$(id -u)
if [ "${user_id}" != 0 ]; then
    echo "The script needs to be executed by the root user."
    sudo $0 "$@"
    exit $?
fi

DIR=$(dirname $(realpath ${0}))
DIR_SSTP=/etc/ss-tproxy

ln -sf ${DIR}/ss-tproxy /usr/local/bin/ss-tproxy
mkdir -p ${DIR_SSTP}
ln -sf ${DIR}/chnroute6.set ${DIR_SSTP}/chnroute6.set
ln -sf ${DIR}/chnroute.set ${DIR_SSTP}/chnroute.set
ln -sf ${DIR}/gfwlist.ext ${DIR_SSTP}/gfwlist.ext
ln -sf ${DIR}/gfwlist.txt ${DIR_SSTP}/gfwlist.txt
ln -sf ${DIR}/ignlist.ext ${DIR_SSTP}/ignlist.ext
cp -uf ${DIR}/ss-tproxy.service /etc/systemd/system/ss-tproxy.service
systemctl daemon-reload
echo "Please link a config file for ${DIR_SSTP}/ss-tproxy.conf"

exit 0


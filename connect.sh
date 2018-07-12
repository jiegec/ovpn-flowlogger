#!/bin/bash
cd "${BASH_SOURCE%/*}" || exit
mkdir -p flow
chown nobody flow
sqlite3 ./flow/flow.db <<EOF
insert into flow(begin_time, trusted_ip, trusted_port, proto, remote_ip, remote_netmask, common_name) values (datetime('now'), '$trusted_ip', '$trusted_port', '$proto', '$ifconfig_pool_remote_ip', '$ifconfig_pool_netmask', '$common_name')
EOF

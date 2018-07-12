#!/bin/bash
cd "${BASH_SOURCE%/*}" || exit
mkdir -p flow
chown nobody flow
sqlite3 ./flow/flow.db <<EOF
update flow set end_time=datetime('now'),
    bytes_recv='$bytes_received',
    bytes_sent='$bytes_sent'
    where trusted_ip='$trusted_ip' and
        trusted_port='$trusted_port' and
        remote_ip='$ifconfig_pool_remote_ip' and
        remote_netmask='$ifconfig_pool_netmask' and
        common_name='$common_name'
EOF

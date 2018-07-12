#!/bin/bash
cd "${BASH_SOURCE%/*}" || exit
mkdir -p flow
chown nobody flow
sqlite3 ./flow/flow.db <<EOF
create table flow(
    begin_time DATE,
    end_time DATE,
    trusted_ip TEXT,
    trusted_port TEXT,
    proto TEXT,
    remote_ip TEXT,
    remote_netmask TEXT,
    common_name TEXT,
    bytes_recv TEXT,
    bytes_sent TEXT)
EOF
chown nobody ./flow/flow.db

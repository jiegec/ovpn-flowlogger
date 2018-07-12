#!/bin/bash
cd "${BASH_SOURCE%/*}" || exit
mkdir -p flow
chown nobody flow
sqlite3 ./flow/flow.db '.headers on' 'select * from flow'

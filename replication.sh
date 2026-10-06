#!/bin/bash
# PLP Lab - Step 4 & 5: Replication

psql -c "CREATE ROLE replicator WITH REPLICATION LOGIN PASSWORD 'reppass';"

# Add this line to pg_hba.conf:
# host replication replicator 127.0.0.1/32 md5

sudo systemctl reload postgresql

rm -rf ~/standby

pg_basebackup -h 127.0.0.1 -U replicator -D ~/standby -R -P -X stream

psql -c "SELECT application_name, state, sync_state FROM pg_stat_replication;"

echo "Replica ready!"

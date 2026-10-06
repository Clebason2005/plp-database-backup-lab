#!/bin/bash
# PLP Lab - Step 1 & 2: Backups

# Step 1: Logical backup
mkdir -p ~/backups/wal
pg_dump -Fc -f ~/backups/bootcamp.dump bootcamp
echo "Verifying backup..."
pg_restore --list ~/backups/bootcamp.dump | head -n 20

# Test restore
createdb bootcamp_check
pg_restore -d bootcamp_check ~/backups/bootcamp.dump
psql bootcamp_check -c "SELECT count(*) FROM students;"
dropdb bootcamp_check

# Step 2: Base backup
pg_basebackup -D ~/backups/base -Ft -z -Xs -P
echo "Backup done!"

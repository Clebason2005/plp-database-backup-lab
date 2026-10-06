#!/bin/bash
# PLP Lab - Step 3: PITR Recovery

# 1. Record time for recovery target
psql bootcamp -c "SELECT now();"

# 2. Simulate disaster
psql bootcamp -c "DELETE FROM students; SELECT count(*) FROM students;"

# 3. Recovery commands (run after stopping postgres)
# sudo systemctl stop postgresql
# rm -rf /var/lib/postgresql/16/main/*
# tar -xzf ~/backups/base/base.tar.gz -C /var/lib/postgresql/16/main/
# echo "restore_command = 'cp ~/backups/wal/%f %p'" >> postgresql.conf
# echo "recovery_target_time = '2025-06-01 10:00:00'" >> postgresql.conf
# echo "recovery_target_action = 'promote'" >> postgresql.conf
# sudo systemctl start postgresql
# psql bootcamp -c "SELECT count(*) FROM students;"

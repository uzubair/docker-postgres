#!/bin/bash

BACKUP_FILE="${POSTGRES_BACKUPS}/${1}"
# pg_dump is a utility to backup PostgresSQL database. It makes consistent backups even
# if the database is being used concurrently. It doesn't block reads and writes.
#
# Reference can be found: https://www.postgresql.org/docs/9.3/static/app-pgdump.html
pg_dump -U ${POSTGRES_USER} -j 4 -c -Fd -v -f ${BACKUP_FILE} ${POSTGRES_DB}

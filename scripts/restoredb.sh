#!/bin/bash

RESTORE_FILE="${POSTGRES_BACKUPS}/${1}"
# pg_restore is a utility to restore PostgresSQL database.
#
# Reference can be found: https://www.postgresql.org/docs/9.1/static/app-pgrestore.html
pg_restore -U ${POSTGRES_USER} -c -Fd -d ${POSTGRES_DB} -v ${RESTORE_FILE}

#!/bin/bash

# Global variables
__database_container="postgres"
__backup_script="backupdb.sh"
__restore_script="restoredb.sh"

# make sure we have atleast one option provided
if [[ $# -eq 0 ]]; then
    usage
fi

# Show usage
usage() {
    echo "Utility script to backup and restore postgres db"
    echo ""
    echo "Usage:"
    echo "`basename $0` [options=]"
    echo ""
    echo "Options:"
    echo "  --help                  Show script usage"
    echo "  --backupdb              Backups postgres db"
    echo "  --restoredb=<name>      Restores specific postgres db"

    exit 0
}

# Postgres database backup
backupdb() {
    echo "Postgres database backup"

    timestamp=`date +%d-%m-%Y"_"%H_%M_%S`
    backupfile="db-${timestamp}"

    docker exec ${__database_container} /bin/sh -c "${__backup_script} ${backupfile}"
}

# Postgres database backup
restoredb() {
    echo "Postgres database restore"
    restorefile="${1}"
    docker exec ${__database_container} /bin/sh -c "${__restore_script} ${restorefile}"
}

option="${1}"
case ${option} in
    --help)
        usage
        ;;
    --backupdb)
        backupdb
        ;;
    --restoredb=*)
        value=${option#*=}
        restoredb ${value}
        ;;
    *)
        usage
        ;;
esac

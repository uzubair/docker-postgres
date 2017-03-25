#!/bin/bash

# make sure we have atleast one option provided
if [[ $# -eq 0 ]]; then
    usage
fi

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

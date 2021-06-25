#!/bin/bash
export ACTION_NAME=$1

# Dump environment variables so they can be sourced by the cronjob.
printenv | sed 's/^\(.*\)$/export \1/g' >> .env.sh

crond -f -L /dev/stdout

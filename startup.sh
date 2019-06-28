#!/bin/sh
echo "Waiting on consul to come up"
wait-for-it.sh "localhost:8500" -- import-keys.sh &
echo "Starting up with $@"
docker-entrypoint.sh "$@"

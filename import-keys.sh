#!/bin/sh
echo "importing keys after startup"
for f in /kv-init/*.json
do
  echo "Importing key-values from file: $f"
  jq 'map(.key as $k | .flags as $f | .value | @base64 as $v | {key: $k, flags: $f, value: $v})' < $f | consul kv import -
done
echo "done importing keys"

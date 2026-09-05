#!/bin/sh
# A stand-in deploy: pretends to roll the version out to an environment.
set -e
env_name="${1:?environment}"
echo "deploying demo-actions $(cat app/VERSION) to $env_name"
sleep 5
echo "deployed to $env_name"

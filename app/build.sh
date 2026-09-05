#!/bin/sh
# A stand-in build: verifies the app files and prints a manifest.
set -e
test -f app/VERSION
echo "built demo-actions $(cat app/VERSION)"

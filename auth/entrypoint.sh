#!/bin/sh

set -e

echo "$GCLOUD_AUTH" | base64 --decode > "$HOME"/gcloud.json
# Change to echo "::[set-env name=FOO;]BAR" when the line below stops working
echo "##[set-env name=GOOGLE_APPLICATION_CREDENTIALS;]$HOME/gcloud.json"
sh -c "gcloud auth activate-service-account --key-file=$HOME/gcloud.json $*"

#!/bin/sh

set -e

echo "$GCLOUD_AUTH" | base64 --decode > "$GITHUB_WORKSPACE"/gcloud.json
# Change to echo "::[set-env name=FOO;]BAR" when the line below stops working
echo "##[set-env name=GOOGLE_APPLICATION_CREDENTIALS;]$GITHUB_WORKSPACE/gcloud.json"
sh -c "gcloud auth activate-service-account --key-file=$GITHUB_WORKSPACE/gcloud.json $*"

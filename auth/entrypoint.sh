#!/bin/sh

set -e

echo "$GCLOUD_AUTH" | base64 --decode > "$GITHUB_WORKSPACE"/gcloud.json
setenv GOOGLE_APPLICATION_CREDENTIALS "$GITHUB_WORKSPACE/gcloud.json"
sh -c "gcloud auth activate-service-account --key-file=$GITHUB_WORKSPACE/gcloud.json $*"

#!/bin/sh

set -e

echo "$GCLOUD_AUTH" | base64 --decode > "$HOME"/gcloud.json
#setenv GOOGLE_APPLICATION_CREDENTIALS "$GITHUB_WORKSPACE/gcloud.json"
#export GOOGLE_APPLICATION_CREDENTIALS="$GITHUB_WORKSPACE/gcloud.json"
sh -c "gcloud auth activate-service-account --key-file=$HOME/gcloud.json $*"

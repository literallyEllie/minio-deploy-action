#!/usr/bin/env bash

set -euxo pipefail

insecure_option=""
if [[ "$MINIO_INSECURE" == "true" ]]; then
  insecure_option="--insecure"
fi

mc alias set ${insecure_option:+"$insecure_option"} deploy "$MINIO_ENDPOINT" "$MINIO_ACCESS_KEY" "$MINIO_SECRET_KEY"

if [[ "$MINIO_CP" == "true" ]]; then
  mc cp ${insecure_option:+"$insecure_option"} $1 "deploy/$2"
else
  mc mirror --overwrite ${insecure_option:+"$insecure_option"} $1 "deploy/$2"
fi

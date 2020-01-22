#!/bin/sh

set -x
set -o errexit -o nounset

mc config host add "s3" "https://s3.amazonaws.com" "${AWS_ACCESS_KEY}" "${AWS_SECRET_KEY}"

mc cp output/kubecf-*.tgz "s3/scf-v3"
echo "URL: https://scf-v3.s3.amazonaws.com/$(basename output/kubecf-*.tgz)"

mc cp output/bundle-*.tgz "s3/kubecf"
echo "URL: https://kubecf.s3.amazonaws.com/$(basename output/bundle-*.tgz)"

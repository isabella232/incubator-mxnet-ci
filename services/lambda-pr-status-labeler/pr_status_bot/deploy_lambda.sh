#!/bin/bash
set -e

echo "Deployment stage (test, prod)"
read config_dir

if [ "$config_dir" == "test" ]; then
    echo "Deploying to test"
    export AWS_PROFILE=mxnet-ci-dev
    sls deploy --stage test
elif [ "$config_dir" == "prod" ]; then
    echo "Deploying to prod"
    export AWS_PROFILE=mxnet-ci
    sls deploy --stage prod
else
    echo "Unrecognized stage: ${config_dir}"
fi

#!/usr/bin/env bash

set -euo pipefail

TAG_PREFIX="repoocaj/ses"

BUILDS=(3.50_sdk_15.0.0 3.50_sdk_15.2.0 4.20_sdk_15.3.0 4.22_sdk_15.3.0 4.22_sdk_16.0.0 4.30c_sdk_16.0.0 \
	4.40_sdk_15.3.0 4.40_sdk_16.0.0)

for build in ${BUILDS[@]}
do
    docker build config_${build} -t ${TAG_PREFIX}:${build}

    #Test the new image with a smoke test
    GET_VERSION=$(docker run -it --rm ${TAG_PREFIX}:${build} /ses/bin/emBuild | grep Release)
    echo "Built ${build}, version is ${GET_VERSION}"
done

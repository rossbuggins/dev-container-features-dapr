#!/bin/bash
set -e

# The install.sh script is the installation entrypoint for any features in this repository. 
#
# The tooling will parse the features.json + user devcontainer, and write 
# any build-time arguments into a feature-set scoped "features.env"
# The author is free to source that file and use it however they would like.
set -a
. ./features.env
set +a


if [ ! -z ${_BUILD_ARG_DAPR} ]; then
    echo "Activating feature 'dapr'"

    wget -q \
      https://raw.githubusercontent.com/dapr/cli/master/install/install.sh \
      -O - \
      | /bin/bash
    dapr init
    docker ps
fi

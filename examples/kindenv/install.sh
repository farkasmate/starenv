#!/bin/bash -eu

curl --silent --location https://kind.sigs.k8s.io/dl/v${ENV_VERSION}/kind-linux-amd64 -o "${ENV_CLI_FILE}"
chmod a+x "${ENV_CLI_FILE}"

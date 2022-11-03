#!/bin/bash -eu

curl --silent --location https://storage.googleapis.com/skaffold/releases/v${ENV_VERSION}/skaffold-linux-amd64 -o "${ENV_CLI_FILE}"
chmod a+x "${ENV_CLI_FILE}"

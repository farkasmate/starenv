#!/bin/bash -eu

curl --silent --location https://dl.k8s.io/release/v${ENV_VERSION}/bin/linux/amd64/kubectl -o "${ENV_CLI_FILE}"
chmod a+x "${ENV_CLI_FILE}"

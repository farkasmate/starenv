#!/bin/bash -eu

ARCH=$(dpkg --print-architecture)

curl --silent --location https://dl.k8s.io/release/v${ENV_VERSION}/bin/linux/${ARCH}/kubectl -o "${ENV_CLI_FILE}"
chmod a+x "${ENV_CLI_FILE}"

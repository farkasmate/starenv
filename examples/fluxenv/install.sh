#!/bin/bash -eu

install_directory=$(dirname "${ENV_CLI_FILE}")

curl --silent --location https://github.com/fluxcd/flux2/releases/download/v${ENV_VERSION}/flux_${ENV_VERSION}_linux_amd64.tar.gz -o /tmp/flux.tar.gz
tar xf /tmp/flux.tar.gz -C "${install_directory}" flux
rm /tmp/flux.tar.gz

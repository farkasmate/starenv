#!/bin/bash -eu

ARCH=$(dpkg --print-architecture)

install_directory=$(dirname "${ENV_CLI_FILE}")

curl --silent --location https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${ENV_VERSION}/kustomize_v${ENV_VERSION}_linux_${ARCH}.tar.gz -o /tmp/kustomize.tar.gz
tar xf /tmp/kustomize.tar.gz -C "${install_directory}" kustomize
rm /tmp/kustomize.tar.gz

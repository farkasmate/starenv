#!/bin/bash -eu

install_directory=$(dirname "${ENV_CLI_FILE}")

curl --silent "https://releases.hashicorp.com/terraform/${ENV_VERSION}/terraform_${ENV_VERSION}_linux_amd64.zip" -o /tmp/terraform.zip
unzip /tmp/terraform.zip terraform -d "${install_directory}"

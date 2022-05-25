# frozen_string_literal: true

require 'fileutils'

desc "Install a specific version of #{ENV.fetch('ENV_NAME')}"

required_arg :version

def create_wrapper(wrapper_file) # rubocop:disable Metrics/MethodLength
  wrapper_script = <<~WRAPPER_SCRIPT
    #!/bin/bash -eu

    cli_name="#{ENV.fetch('ENV_CLI_NAME')}"
    env_name="#{ENV.fetch('ENV_NAME')}"
    global_version_file="#{GLOBAL_VERSION_FILE}"
    local_version_file="./#{ENV.fetch('ENV_VERSION_FILE')}"
    versions_directory="#{VERSIONS_DIRECTORY}"

    if [ -f "${local_version_file}" ]
    then
      current_version_file="${local_version_file}"
    elif [ -f "${global_version_file}" ]
    then
      current_version_file="${global_version_file}"
    else
      "${env_name}" list
       exit 1
    fi

    current_version=$(cat "${current_version_file}")
    actual_cli="${versions_directory}/${current_version}/${cli_name}"

    if [ ! -f "${actual_cli}" ]
    then
      auto_install="${#{ENV.fetch('ENV_NAME').upcase}_AUTO_INSTALL:-false}"

      if [ "${auto_install}" != "true" ]
      then
        echo "version '${current_version}' was requested, but not installed and #{ENV.fetch('ENV_NAME').upcase}_AUTO_INSTALL is not 'true'"
        exit 2
      fi

      echo "version '${current_version}' is not installed (set by ${current_version_file}). Installing now as #{ENV.fetch('ENV_NAME').upcase}_AUTO_INSTALL==true"
      "${env_name}" install "${current_version}"
    fi

    exec "${actual_cli}" "${@}"
  WRAPPER_SCRIPT

  FileUtils.mkdir_p(BIN_DIRECTORY)
  File.write(wrapper_file, wrapper_script)
  File.chmod(0o0755, wrapper_file)
end

def mock_install
  mock_script = <<~MOCK_SCRIPT
    #!/bin/bash

    echo "#{ENV.fetch('ENV_CLI_NAME')} version: #{version}"
    echo "args:"
    for arg in "${@}"
    do
      echo "  ${arg}"
    done
  MOCK_SCRIPT

  install_directory = File.join(VERSIONS_DIRECTORY, version)
  mock_file = File.join(install_directory, ENV.fetch('ENV_CLI_NAME'))
  FileUtils.mkdir(install_directory)
  File.write(mock_file, mock_script)
  File.chmod(0o0755, mock_file)
end

def run
  wrapper_file = File.join(BIN_DIRECTORY, ENV.fetch('ENV_CLI_NAME'))
  create_wrapper(wrapper_file) unless File.exist? wrapper_file

  FileUtils.mkdir_p(VERSIONS_DIRECTORY) unless File.exist? VERSIONS_DIRECTORY
  versions = Dir[File.join(VERSIONS_DIRECTORY, '*')].collect { |version_dir| File.basename(version_dir) }

  return if versions.include? version

  mock_install
end

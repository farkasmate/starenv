#!/usr/bin/env ruby
# frozen_string_literal: true

require 'colorize'
require 'toys-core'

GLOBAL_VERSION_FILE = File.join(Dir.home, ENV.fetch('ENV_DIRECTORY'), 'version')
LOCAL_VERSION_FILE = File.join(Dir.pwd, ENV.fetch('ENV_VERSION_FILE'))
VERSIONS_DIRECTORY = File.join(Dir.home, ENV.fetch('ENV_DIRECTORY'), 'versions')

CURRENT_VERSION_FILE = if File.exist? LOCAL_VERSION_FILE
                         LOCAL_VERSION_FILE
                       elsif File.exist? GLOBAL_VERSION_FILE
                         GLOBAL_VERSION_FILE
                       end

cli = Toys::CLI.new(
  executable_name: ENV.fetch('ENV_NAME'),
  middleware_stack: [
    Toys::Middleware.spec(
      :handle_usage_errors
    ),
    Toys::Middleware.spec(
      :show_help,
      help_flags: ['-h', '--help'],
      default_recursive: true,
      fallback_execution: true,
      stream: $stderr
    )
  ]
)

toys_dir = if File.exist? '/.dockerenv'
             '/toys'
           else
             'toys'
           end

cli.add_config_path toys_dir

exit(cli.run(*ARGV))

# frozen_string_literal: true

desc 'Switch a version to use'

flag :global do
  desc 'Set global version'
  accept TrueClass
  default false
end

required_arg :version do
  desc 'Version to use'
  accept(/^\d+(\.\d+){0,2}$/)
end

def run
  File.write(GLOBAL_VERSION_FILE, version) if global || (!File.exist? GLOBAL_VERSION_FILE)

  File.write(LOCAL_VERSION_FILE, version) unless global
end

# frozen_string_literal: true

desc 'Switch a version to use'

required_arg :version

def run
  if File.exist? GLOBAL_VERSION_FILE
    File.write(LOCAL_VERSION_FILE, version)
  else
    File.write(GLOBAL_VERSION_FILE, version)
  end
end

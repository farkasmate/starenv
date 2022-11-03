# frozen_string_literal: true

require 'fileutils'

desc 'List all installed versions'

def run
  FileUtils.mkdir_p(VERSIONS_DIRECTORY)

  current_version = File.read(CURRENT_VERSION_FILE).chomp unless CURRENT_VERSION_FILE.nil?
  default_set = false

  Dir[File.join(VERSIONS_DIRECTORY, '*')].each do |version_dir|
    version = File.basename(version_dir)

    if version == current_version
      default_set = true
      puts "* #{version} (set by #{File.expand_path(CURRENT_VERSION_FILE)})"

      next
    end

    puts "  #{version}"
  end

  puts "No default set. Set with '#{ENV.fetch('ENV_NAME')} use <version>'".green unless default_set
end

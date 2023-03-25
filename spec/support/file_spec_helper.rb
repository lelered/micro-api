require 'fileutils'

module FileSpecHelper
  def config_file
    "#{Rails.root}/config/initializers/micro_api.rb"
  end

  def staging_env_file
    "#{Rails.root}/config/environments/staging.rb"
  end

  def remove_config
    FileUtils.remove_file config_file      if File.file?(config_file)
    FileUtils.remove_file staging_env_file if File.file?(staging_env_file)
  end
end

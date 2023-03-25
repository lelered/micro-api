require 'fileutils'

module FileSpecHelper
  def config_file
    "#{Rails.root}/config/initializers/micro_api.rb"
  end

  def remove_config
    FileUtils.remove_file config_file if File.file?(config_file)
  end
end

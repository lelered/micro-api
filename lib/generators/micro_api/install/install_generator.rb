module MicroApi
  # main generator installer
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("templates", __dir__)

    argument :component, type: :string, default: 'all',
                         banner: "all|initializer"

    def main
      method_name = "generate_micro_api_#{component}"
      return unless self.class.private_method_defined?(method_name)

      send(method_name)
    end

    private

    def local_methods
      private_methods.select { |e| e.to_s.include? "generate_micro_api_" }
    end

    desc "This generator creates all installs"
    def generate_micro_api_all
      local_methods.each do |method_name|
        next if method_name == __method__

        send(method_name)
      end
    end

    desc "This generator creates an initializer file at config/initializers"
    def generate_micro_api_initializer
      template "micro_api.rb", "#{Rails.root}/config/initializers/micro_api.rb"
    end
  end
end

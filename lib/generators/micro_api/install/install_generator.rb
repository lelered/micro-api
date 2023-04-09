module MicroApi
  # main generator installer
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("templates", __dir__)

    argument :component, type: :string, default: 'all',
                         banner: "all|application|initializer|route"

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

    desc "This generator add row in application.rb file"
    def generate_micro_api_application
      application_list = ["\n"]
      application_list << "config.active_record.default_timezone = :utc" if defined?(ActiveRecord)
      application_list << "config.time_zone = 'CET'"

      inject_into_file 'config/application.rb', before: /\n  end$/ do
        application_list.join("\n    ").gsub("    \n", "\n")
      end
    end

    desc "This generator creates an initializer file at config/initializers"
    def generate_micro_api_initializer
      template "micro_api.rb", "#{Rails.root}/config/initializers/micro_api.rb"
      template "staging.rb", "#{Rails.root}/config/environments/staging.rb"
    end

    desc "This generator add 'api namespace' rows in routes.rb file"
    def generate_micro_api_route_api_namespace
      inject_into_file 'config/routes.rb', before: "  # Defines the root path route" do
        "  namespace :api, defaults: { format: :json } do\n  end\n\n"
      end
    end

    desc "This generator add final rows in routes.rb file"
    def generate_micro_api_route_last
      routes_list = [
        "\n",
        "mount MicroApi::Engine, at: MicroApi.routes_path, as: '#{MicroApi.routes_path}'",
        "match '*path', to: 'micro_api/static#no_route_matches', via: :all"
      ]

      inject_into_file 'config/routes.rb', before: /\nend$/ do
        routes_list.join("\n  ").gsub("  \n", "\n")
      end
    end
  end
end

require_relative "lib/micro_api/version"

Gem::Specification.new do |spec|
  spec.name        = "micro_api"
  spec.version     = MicroApi::VERSION
  spec.authors     = [""]
  spec.email       = [""]
  spec.homepage    = "https://github.com/lelered/micro_api"
  spec.summary     = "Engine plugin for Ruby on Rails applications"
  spec.description = "Rails engine plugin that would like to help the startup of rails applications oriented to microservices or, in general, to the cloud."
  spec.license     = "MIT"
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"]   = "#{spec.metadata["source_code_uri"]}/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end
  spec.test_files = Dir["spec/**/*"]

  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "simplecov"

  spec.add_dependency "rails", ">= 7.0.4.3"
end

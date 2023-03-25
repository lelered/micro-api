require 'rails_helper'
require 'rails/generators'
require 'generators/micro_api/install/install_generator'

RSpec.describe MicroApi::InstallGenerator, type: :generator do
  before :all do
    remove_config
  end

  after :all do
    remove_config
  end

  it 'installs config file properly' do
    described_class.start
    system "cd spec/dummy/ && bin/rails generate micro_api:install"
    expect(File.file?(config_file)).to be true
  end

  it 'installs config file properly routing', type: :routing do
    expect(get("#{MicroApi.routes_path}/version")).to route_to(
      controller: 'micro_api/static',
      action: 'version',
      format: :json
    )

    expect(get("#{MicroApi.routes_path}/healthz")).to route_to(
      controller: 'micro_api/static',
      action: 'healthz',
      format: :json
    )
  end
end

require "bundler/setup"
require 'webmock'
require 'webmock/rspec'
require "caselaw"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"
  config.expose_dsl_globally = true

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def stub(path, fixture_name)
  root = "https://api.case.law/v1/"
  path = root + path
  stub_request(:get, path).
         with(
           headers: {
       	  'Authorization'=>'Token SECRET_KEY'
           })
         .to_return(status: 200, body: fixture(fixture_name), headers: {"Content-Type"=> "application/json"})
end

def fixture_path(file = nil)
  path = File.expand_path("../fixtures", __FILE__)
  file.nil? ? path : File.join(path, file)
end

def fixture(file)
  file = File.read(fixture_path(file))
end

$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require "caselaw/version"


Gem::Specification.new do |spec|
  spec.name          = "caselaw"
  spec.version       = Caselaw::VERSION
  spec.authors       = ["tombonan"]
  spec.email         = ["tombonan018@gmail.com"]
  spec.summary       = "Case.law API wrapper"
  spec.description   = "Wrapper for the Caselaw Access Project API"
  spec.homepage      = "https://github.com/tombonan/caselaw"
  spec.license       = "MIT"

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  
  spec.add_runtime_dependency "httparty", "~> 0.16.3"
  spec.add_runtime_dependency "hashie", "~> 3.6"

  spec.post_install_message = "Welcome to the Case Law party!"

  all_files = `git ls-files`.split("\n")
  test_files = `git ls-files -- {test,spec,features}/*`.split("\n")

  spec.files         = all_files - test_files
  spec.test_files    = test_files
  spec.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end

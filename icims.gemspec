$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "icims/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "icims"
  s.version     = Icims::VERSION
  s.authors     = ["Mathieu Gagné"]
  s.email       = ["mgagne@vigilantglobal.com"]
  s.homepage    = ""
  s.summary     = "iCIMS API Integration"
  s.description = "Ruby library for API requests with iCIMS Applicant Tracking System"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency 'httparty'
  s.add_dependency 'activesupport'

  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-nc"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-debugger"
  s.add_development_dependency "webmock"
end

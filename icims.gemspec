$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "icims/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "icims"
  s.version     = Icims::VERSION
  s.authors     = ["Mathieu Gagné"]
  s.email       = ["gagne.mathieu@hotmail.com"]
  s.homepage    = "https://github.com/mathieugagne/icims"
  s.summary     = "iCIMS API Integration"
  s.description = "Ruby library for API requests with iCIMS Applicant Tracking System"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency 'httparty', '~> 0.13'
  s.add_dependency 'activesupport', '~> 4.1'

end

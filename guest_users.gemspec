$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "guest_users/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "guest_users"
  s.version     = GuestUsers::VERSION
  s.authors     = ["Joachim Dornbusch"]
  s.email       = ["joachim.dornbusch@ehess.fr"]
  s.homepage    = "http://gitlab.ehess.fr"
  s.summary     = "External users invitations."
  s.description = "Provide ability to invite external users from ."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.6"

  s.add_development_dependency "sqlite3"
end

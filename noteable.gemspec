$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "noteable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "noteable"
  s.version     = Noteable::VERSION
  s.authors     = ["yomike05"]
  s.email       = ["yomike05@gmail.com"]
  s.homepage    = "http://github.com/yomike05"
  s.summary     = "Notes for your models."
  s.description = "Notes for your models."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.3"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end

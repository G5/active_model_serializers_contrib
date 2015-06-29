$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "active_model_serializers_contrib/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "active_model_serializers_contrib"
  s.version     = ActiveModelSerializersContrib::VERSION
  s.authors     = ["G5", "Ramon Tayag"]
  s.email       = ["lateam@getg5.com", "ramon.tayag@gmail.com"]
  s.homepage    = "https://github.com/g5/active_model_serializers_contrib"
  s.summary     = "Modules/classes that extend AMS with more functionality"
  s.description = "Modules/classes that extend AMS with more functionality"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "active_model_serializers"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rails", "~> 4.2.3"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "responders"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "kaminari"
end

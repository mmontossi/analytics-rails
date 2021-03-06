$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'analytics/rails/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'analytics-rails'
  s.version     = Analytics::Rails::VERSION
  s.authors     = ['mmontossi']
  s.email       = ['mmontossi@museways.com']
  s.homepage    = 'https://github.com/mmontossi/analytics-rails'
  s.summary     = 'Google analytics for rails.'
  s.description = 'Adds a helper to create the google analytics script in rails.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.1'

  s.add_development_dependency 'pg', '~> 0.21'
end

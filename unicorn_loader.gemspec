# -*- encoding : utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "unicorn_loader"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "unicorn_loader"
  s.version     = UnicornLoader::VERSION
  s.authors     = ["Ricard Forniol Agustí"]
  s.email       = ["ricard@forniol.cat"]
  s.homepage    = "http://github.com/ritxi/unicorn_loader"
  s.summary     = "Configure your development environment to run on nginx and unicorn"
  s.description = "Command line tools to configure nginx and run rack applications under unicorn webserver"

  s.bindir = 'bin'
  s.files = Dir["{lib}/**/*", "{bin,templates}/*"] + ["MIT-LICENSE", "README.md"]
  s.require_paths = ['lib']

  s.add_dependency "thor"

  s.executables   = ['unicorn_loader', 'app_config']
  s.add_development_dependency "rspec"
  s.add_development_dependency "fuubar"
  s.add_development_dependency "nyan-cat-formatter"

end

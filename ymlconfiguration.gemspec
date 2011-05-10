# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ymlconfiguration/version"

Gem::Specification.new do |s|
  s.name        = "ymlconfiguration"
  s.version     = Ymlconfiguration::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mark Lanett"]
  s.email       = ["mark.lanett@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Easily access configuration settings in a yml file.}
  
  s.rubyforge_project = "ymlconfiguration"
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

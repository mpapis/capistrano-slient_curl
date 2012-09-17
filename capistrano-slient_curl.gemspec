#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "capistrano-slient_curl"
  s.version     = "1.0.0"
  s.authors     = ["Michal Papis"]
  s.email       = ["mpapis@gmail.com"]
  s.homepage    = "https://github.com/mpapis/capistrano-slient_curl"
  s.summary     =
  s.description = %q{simple helper run commands with silenced curl output.}

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")

  #s.add_development_dependency "tf"
  #s.add_development_dependency "smf-gem"
end

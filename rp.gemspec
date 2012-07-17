# -*- encoding: utf-8 -*-

require File.expand_path('../lib/rp/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "rp"
  s.version     = Rp::VERSION
  s.authors     = ["Samuel Tonini"]
  s.email       = ["tonini.samuel@gmail.com"]
  s.homepage    = "http://www.github.com/tonini"
  s.summary     = %q{rp (Ruby Projector) is a tiny command line app to help creating new ruby development enviroments, isolated with rvm}
  s.description = s.summary

  s.rubyforge_project = "rp"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
end

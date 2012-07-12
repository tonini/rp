# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rp/version"

Gem::Specification.new do |s|
  s.name        = "rp"
  s.version     = Rp::VERSION
  s.authors     = ["Samuel Tonini"]
  s.email       = ["tonini.samuel@gmail.com"]
  s.homepage    = "http://www.github.com/tonini"
  s.summary     = %q{}
  s.description = %q{}

  s.rubyforge_project = "rp"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
end

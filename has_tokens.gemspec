# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "has_tokens/version"

Gem::Specification.new do |s|
  s.name        = "has_tokens"
  s.version     = HasTokens::VERSION
  s.authors     = ["coreyhaines", "josh cheek"]
  s.email       = ["coreyhaines@gmail.com", "josh.cheek@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Creates tokens for accessing ActiveRecord objects}
  s.description = %q{Allows you to declaratively specify token-based access for your ActiveRecord objects.}

  s.rubyforge_project = "has_tokens"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
end

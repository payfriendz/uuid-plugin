# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "uuid_extension/version"

Gem::Specification.new do |s|
  s.name        = "uuid_extension"
  s.version     = UuidExtension::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Sebastian Cohnen"]
  s.email       = [""]
  s.homepage    = ""
  s.summary     = %q{A before create that set the ID using uuid}
  s.description = %q{A before create that set the ID using uuid}

  s.add_dependency 'activerecord', '~> 3.0.4'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
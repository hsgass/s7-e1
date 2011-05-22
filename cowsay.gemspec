# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cowsay/version"

Gem::Specification.new do |s|
  s.name        = "ruby-cowsay"
  s.version     = Cowsay::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Steve Gass"]
  s.email       = ["hsgass@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A Ruby wrapper around cowsay, with SVG output.}
  s.description = %q{}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features,.autotest,.rspec}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rspec', '~>2.5.0'

end

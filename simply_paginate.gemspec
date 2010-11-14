# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "simply_paginate"

Gem::Specification.new do |s|
  s.name        = "simply_paginate"
  s.version     = SimplyPaginate::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Stefan Penner"]
  s.email       = ["stefan.penner@gmail.com"]
  s.homepage    = "http://github.com/stefanpenner/simply_paginate"
  s.summary     = %q{Fast and simple rails pagination}
  s.description = %q{Fast, simple, and low memory pagination for larger datasets}

  s.rubyforge_project = "simply_paginate"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_development_dependency "rspec", "~> 2.0.0"
  s.add_development_dependency "rake"
  s.add_dependency "activerecord",  "~> 3.0.0"
  s.add_dependency "activesupport", "~> 3.0.0"
  s.add_dependency "actionpack",    "~> 3.0.0"
end

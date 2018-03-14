# -*- encoding: utf-8 -*-
# $:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-sql_fingerprint"
  spec.version       = "0.0.1"
  spec.authors       = ["Takahiro Kikumoto"]
  spec.email         = ["kikumoto.takahiro@hamee.co.jp"]

  spec.summary       = "A Fluent filter plugin to convert sql to sql's fingerprint"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/kikumoto/fluent-plugin-sql_fingerprint"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "fluentd", [">= 0.14.0", "< 2"]
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "test-unit"
end

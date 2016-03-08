# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "lockfile_preserver/version"

Gem::Specification.new do |spec|
  spec.name          = "lockfile_preserver"
  spec.version       = LockfilePreserver::VERSION
  spec.authors       = ["JuanitoFatas"]
  spec.email         = ["katehuang0320@gmail.com"]

  spec.summary       = "LockfilePreserver preserves section you don't want to update."
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/jollygoodcode/lockfile_preserver"
  spec.license       = "UNLICENSE"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end

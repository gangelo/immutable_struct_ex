
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "immutable_struct_ex/version"

Gem::Specification.new do |spec|
  spec.name          = "immutable_struct_ex"
  spec.version       = ImmutableStructEx::VERSION
  spec.authors       = ['Gene M. Angelo, Jr.']
  spec.email         = ['public.gma@gmail.com']

  spec.summary       = 'Creates an immutable struct in one call.'
  spec.description   = 'Creates an immutable struct in one call.'
  spec.homepage      = 'https://github.com/gangelo/immutable_struct_ex'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

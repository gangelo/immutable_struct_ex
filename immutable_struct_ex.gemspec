# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'immutable_struct_ex/version'

Gem::Specification.new do |spec|
  spec.name          = 'immutable_struct_ex'
  spec.version       = ImmutableStructEx::VERSION
  spec.authors       = ['Gene M. Angelo, Jr.']
  spec.email         = ['public.gma@gmail.com']

  spec.summary       = 'Creates an immutable struct in one step.'
  spec.description   = 'Creates an immutable struct in one step.'
  spec.homepage      = 'https://github.com/gangelo/immutable_struct_ex'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new(">= 3.0.1", "< 4.0")

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise 'RubyGems 2.0 or newer is required to protect against ' \
  #     'public gem pushes.'
  # end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.4', '>= 2.4.21'
  spec.add_development_dependency 'pry-byebug', '~> 3.9'
  spec.add_development_dependency 'reek', '~> 6.1', '>= 6.1.1'
  spec.add_development_dependency 'rspec', '>= 3.10'
  spec.add_development_dependency 'rubocop', '~> 1.35'
  spec.add_development_dependency 'rubocop-performance', '~> 1.14', '>= 1.14.3'
  spec.add_development_dependency 'rubocop-rake', '~> 0.6.0'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.12', '>= 2.12.1'
  spec.add_development_dependency 'simplecov', '~> 0.22.0'
  spec.add_development_dependency 'rake', '~> 13.0', '>= 13.0.6'
  spec.post_install_message = <<~POST_INSTALL
    Thank you for installing immutable_struct_ex.

    View the dsu README.md here: https://github.com/gangelo/immutable_struct_ex
    View the dsu CHANGELOG.md: https://github.com/gangelo/immutable_struct_ex/blob/main/CHANGELOG.md

                *
               ***
             *******
            *********
     ***********************
        *****************
          *************
         ******* *******
        *****       *****
       ***             ***
      **                 **

    Using immutable_struct_ex? immutable_struct_ex is made available free of charge. Please consider giving this gem a STAR on GitHub as well as sharing it with your fellow developers on social media.

    Knowing that immutable_struct_ex is being used and appreciated is a great motivator to continue developing and improving immutable_struct_ex.

    >>> Star it on github: https://github.com/gangelo/immutable_struct_ex
    >>> Share on social media: https://rubygems.org/gems/immutable_struct_ex

    Thank you!

    <3 Gene
  POST_INSTALL
end

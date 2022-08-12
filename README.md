[![GitHub version](http://badge.fury.io/gh/gangelo%2Fimmutable_struct_ex.svg)](https://badge.fury.io/gh/gangelo%2Fimmutable_struct_ex)
[![Gem Version](https://badge.fury.io/rb/immutable_struct_ex.svg)](https://badge.fury.io/rb/immutable_struct_ex)

[![](http://ruby-gem-downloads-badge.herokuapp.com/immutable_struct_ex?type=total)](http://www.rubydoc.info/gems/immutable_struct_ex/)
[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/gems/immutable_struct_ex/)

[![Report Issues](https://img.shields.io/badge/report-issues-red.svg)](https://github.com/gangelo/immutable_struct_ex/issues)

[![License](http://img.shields.io/badge/license-MIT-yellowgreen.svg)](#license)

# ImmutableStructEx

_ImmutableStructEx_ is yet another immutable struct. What makes ImmutableStructEx different, is that it allows you to create immutable structs in one step _by default_. In other words, other immutable struct gems force you to first define the struct, then instantiate the struct object; or, define the struct and instantiate the struct object via chaining. For example:

## Other Immutable Structs

```ruby
# Two steps...
some_immutable_struct = SomeImmutableStruct.new(:first, :last, :phone)
some_immutable_struct.new(first: 'John', last: 'Doe', phone: '(201) 230-7281')

# Chaining...
some_immutable_struct = SomeImmutableStruct.new(:first, :last, :phone)
                          .new(first: 'John', last: 'Doe', phone: '(201) 230-7281')
```

## ImmutableStructEx
ImmutableStructEx allows you do this in one step:

```ruby
immutable_struct_ex = ImmutableStructEx.new(first: 'John', last: 'Doe', phone: '(201) 230-7281')
immutable_struct_ex.first   
#=> 'John'
immutable_struct_ex[:first]
#=> 'John'
immutable_struct_ex.last    
#=> 'Doe'
immutable_struct_ex.phone   
#=> '(201) 230-7281'
```
### Immutable
Like other immutable structs, ImmutableStructEx also removes methods that change the state of the object:
```ruby
immutable_struct_ex.first = 'Joe'
#=> NoMethodError: undefined method `first='...
immutable_struct_ex[:first] = 'Joe'
#=> NoMethodError: undefined method `[]='...
```

### Blocks
Also, not unlike other immutable structs, ImmutableStructEx also allows you to pass a block:
```ruby
# With a block
immutable_struct_ex = ImmutableStructEx.new(first: 'John', last: 'Doe', phone: '(201) 230-7281') do
  def john?
    first == 'John'
  end
end
immutable_struct_ex.john?
#=> true
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'immutable_struct_ex'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install immutable_struct_ex

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/immutable_struct_ex. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ImmutableStructEx project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/immutable_struct_ex/blob/master/CODE_OF_CONDUCT.md).

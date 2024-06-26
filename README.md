[![Ruby](https://github.com/gangelo/immutable_struct_ex/actions/workflows/ruby.yml/badge.svg)](https://github.com/gangelo/immutable_struct_ex/actions/workflows/ruby.yml)
[![GitHub version](http://badge.fury.io/gh/gangelo%2Fimmutable_struct_ex.svg?refresh=8)](https://badge.fury.io/gh/gangelo%2Fimmutable_struct_ex)
[![Gem Version](https://badge.fury.io/rb/immutable_struct_ex.svg?refresh=8)](https://badge.fury.io/rb/immutable_struct_ex)
[![](http://ruby-gem-downloads-badge.herokuapp.com/immutable_struct_ex?type=total)](http://www.rubydoc.info/gems/immutable_struct_ex/)
[![Documentation](http://img.shields.io/badge/docs-rdoc.info-blue.svg)](http://www.rubydoc.info/gems/immutable_struct_ex/)
[![Report Issues](https://img.shields.io/badge/report-issues-red.svg)](https://github.com/gangelo/immutable_struct_ex/issues)
[![License](http://img.shields.io/badge/license-MIT-yellowgreen.svg)](#license)

# immutable_struct_ex

immutable_struct_ex is yet another immutable struct. What makes immutable_struct_ex different, is that it allows you to create immutable structs in one step _by default_. In other words, other immutable struct gems force you to first define the struct, then instantiate the struct object; or, define the struct and instantiate the struct object via chaining. For example:

## Other Immutable Structs

```ruby
# How OTHER immutable structs declare and instantiate, two steps...
some_immutable_struct = SomeImmutableStruct.new(:first, :last, :phone)
some_immutable_struct.new(first: 'John', last: 'Doe', phone: '(201) 230-7281')

# How OTHER immutable structs chain...
some_immutable_struct = SomeImmutableStruct.new(:first, :last, :phone)
                          .new(first: 'John', last: 'Doe', phone: '(201) 230-7281')
```

## immutable_struct_ex
immutable_struct_ex allows you to instantiate and initialize the object _in one step:_

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
Like other immutable structs, immutable_struct_ex also removes methods that change the state of the object, making it _immutable:_

```ruby
immutable_struct_ex.first = 'Joe'
#=> NoMethodError: undefined method `first='...

immutable_struct_ex[:first] = 'Joe'
#=> NoMethodError: undefined method `[]='...
```

### Blocks
Also, not unlike other immutable structs, immutable_struct_ex also allows you to pass a block:

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

### Other Examples
Get creative. Below is an example of an immutable struct that provides _redaction_:

```ruby
# Redactable, immutable struct
user = {
  username: 'jdoe',
  password: 'p@55w0rD',
  ssn: '123-70-9182'
}

immutable_struct_ex = ImmutableStructEx.new(**user) do
  REDACT = %i(password ssn).freeze

  def inspect
    to_s
  end

  def to_s
    super.to_s.tap do |string|
      REDACT.each do |redact|
        string.gsub!(/( #{Regexp.quote(redact.to_s)}=")(.*?)(")/, '\1[REDACTED]\3')
      end
    end
  end

  def to_h
    super.to_h.tap do |hash|
      REDACT.each { |redact| hash[redact] = '[REDACTED]' }
    end
  end
end

immutable_struct_ex.inspect
#=> "#<struct username=\"jdoe\", password=\"[REDACTED]\", ssn=\"[REDACTED]\">"

immutable_struct_ex.to_h
#=> {:username=>"jdoe", :password=>"[REDACTED]", :ssn=>"[REDACTED]"}
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

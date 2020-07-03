# SWGOH::API
Ruby client wrapper for the API at https://api.swgoh.help

## Ruby Gem
https://rubygems.org/gems/SWGOH-API

### Installation

Add this line to your application's Gemfile:

```ruby
gem 'SWGOH-API'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install SWGOH-API

## Usage
```ruby
# Require the gem
require 'swgoh/api'

# Authenticate
SWGOH::API.auth('username', 'password')

#
ally_code_1 = 111111111
ally_code_2 = 222222222

SWGOH::API.get_players([ally_code_1, ally_code_2])
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`. 

To test in irb, run `irb -rubygems`
```
$ irb -rubygems           
irb(main):001:0> require 'swgoh/api'
=> true
irb(main):002:0> SWGOH::API.auth('username', 'password')
=> nil
irb(main):003:0> SWGOH::API.get_players('123456789')
=> {...}
```

To release a new version, update the version number in `version.rb`, commit your changes in git, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jquass/SWGOH-API. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/jquass/SWGOH-API/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SWGOH::API project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jquass/SWGOH-API/blob/master/CODE_OF_CONDUCT.md).




# SWGOH::API [![Gem Version](https://badge.fury.io/rb/SWGOH-API.svg)](https://badge.fury.io/rb/SWGOH-API)
Ruby client wrapper for the API at https://api.swgoh.help .

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
require 'SWGOH/API/CLIENT/client'

# Create a new client
client = CLIENT.new

# Two ways to authenticate the client
access_token = client.authorize("username", "password")

client.access_token = access_token

# Start making requests
ally_code = 123456789

json = client.get_players([ally_code])
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests.

To install this gem onto your local machine, run `gem install 'SWGOH-API'`. 

To test the client using `irb`, run this.
```
$ irb -rubygems               
irb(main):001:0> require 'SWGOH/API/CLIENT/client'
=> true
irb(main):002:0> client = CLIENT.new
=> #<CLIENT:0x00007fdf90087b28 @language="ENG_US", @enums=false, @structure=false, @access_token=nil>
irb(main):003:0> client.authorized?
=> false
irb(main):004:0> client.access_token = 'myexistingtoken'
=> "myexistingtoken"
irb(main):005:0> client.authorized?
=> true
```

To release a new version, update the version number in `version.rb`, run `gem build SWGOH-API.gemspec`, commit the changes, and then run `bundle exec rake release`. 
That will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jquass/SWGOH-API. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/jquass/SWGOH-API/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SWGOH::API project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jquass/SWGOH-API/blob/master/CODE_OF_CONDUCT.md).

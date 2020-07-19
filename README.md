# SWGOH::API [![Gem Version](https://badge.fury.io/rb/SWGOH-API.svg)](https://badge.fury.io/rb/SWGOH-API)
Ruby client wrapper for the API at https://api.swgoh.help .

### Installation

Add this line to your application's Gemfile:

```ruby
gem 'SWGOH-API'
```

And then rake:

    $ bundle exec rake

## Usage
```ruby
# Require the gem
require 'SWGOH/API/CLIENT/client'

# Create a new client
client = CLIENT.new

# Generate a new access_token
access_token = client.authorize("username", "password")

# Or authenticate with a saved access_token
client.access_token = access_token

# Then start making requests
json = client.get_players([123456789])
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests.

To install this gem onto your local machine, run `gem install 'SWGOH-API'`. 

### irb
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

### Release
These are the steps to create and tag a new version, push git commits and tags, and push the new gem version to [rubygems.org](https://rubygems.org).

- Update the version number in `version.rb`
- Run `gem build SWGOH-API.gemspec` 
- Create a new version commit
- Rollup the last `N` commits since a release `git rebase -i HEAD~N`
- Release the new version `bundle exec rake release` 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jquass/SWGOH-API. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/jquass/SWGOH-API/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conductir

Everyone interacting in the SWGOH::API project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jquass/SWGOH-API/blob/master/CODE_OF_CONDUCT.md).

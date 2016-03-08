# LockfilePreserver

[![Gem Version](https://badge.fury.io/rb/lockfile_preserver.svg)](https://badge.fury.io/rb/lockfile_preserver)
[![Build Status](https://travis-ci.org/jollygoodcode/lockfile_preserver.svg?branch=master)](https://travis-ci.org/jollygoodcode/lockfile_preserver)

Preserve `BUNDLED_WITH` section of your lockfile!

## Installation

Add this line to your application's Gemfile:

```ruby
gem "lockfile_preserver"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lockfile_preserver

## Usage

```ruby
LockfilePreserver.keep(gemfile, updated_gemfile, :bundled_with)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jollygoodcode/lockfile_preserver.

## The UNLICENSE

See [UNLICENSE](/UNLICENSE).

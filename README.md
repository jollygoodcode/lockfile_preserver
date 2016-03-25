# LockfilePreserver

[![Gem Version](https://badge.fury.io/rb/lockfile_preserver.svg)](https://badge.fury.io/rb/lockfile_preserver)
[![Build Status](https://travis-ci.org/jollygoodcode/lockfile_preserver.svg?branch=master)](https://travis-ci.org/jollygoodcode/lockfile_preserver)
[![Code Climate](https://codeclimate.com/github/jollygoodcode/lockfile_preserver/badges/gpa.svg)](https://codeclimate.com/github/jollygoodcode/lockfile_preserver)

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

Given a folder where `Gemfile` has some outdated gems:

```
.
├── Gemfile
└── Gemfile.lock
```

```ruby
lockfile = IO.read "Gemfile.lock"
```

Then we do a `bundle update`. The lockfile has been updated:

```ruby
updated_lockfile = IO.read "Gemfile.lock"
```

Preserve `BUNDLED_WITH` changes to your lockfile:

```ruby
LockfilePreserver.keep(lockfile, updated_lockfile)
```

That's it!

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Credits

A huge THANK YOU to all our [contributors](https://github.com/jollygoodcode/dasherize/graphs/contributors)! :heart:

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jollygoodcode/lockfile_preserver.

## The UNLICENSE

See [UNLICENSE](/UNLICENSE).

## Maintained by Jolly Good Code

[![Jolly Good Code](https://cloud.githubusercontent.com/assets/1000669/9362336/72f9c406-46d2-11e5-94de-5060e83fcf83.jpg)](http://www.jollygoodcode.com)

We specialise in rapid development of high quality MVPs. [Hire us](http://www.jollygoodcode.com/#get-in-touch) to turn your product idea into reality.

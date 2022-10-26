# Capistrano::RunningProcessCheck

This gem checks running process names before all Capistrano tasks, to prevent the process effects deployment.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-running_process_check'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install capistrano-running_process_check

## Usage


Add line below to `Capifile`.

```ruby
require "capistrano/running_process_check"
```

Please append process names to disallow running while deployment.

```ruby
append :disallowed_running_processes, /foo/, "bar"
```

When you run `cap` command (with stage name), checks running process. And if it is running, prints message below and abort deployment.

        ================================================================================
        !!! Some /foo/ process(es) are running. Please kill them. !!!
        ================================================================================


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/labocho/capistrano-running_process_check.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

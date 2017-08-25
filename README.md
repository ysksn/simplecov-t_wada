# Simplecov::TWada

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simplecov-t_wada', require: false
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simplecov-t_wada

## Usage

**AA and Message are shown only when your test coverage is below** `SimpleCov.minimum_coverage`.

Edit your `spec_helper.rb`, `test_helper.rb`, or `.simplecov` like below:

```ruby
# test_helper.rb

SimpleCov.start 'rails' do
  # Don't forget to specify this value
  SimpleCov.minimum_coverage 95

  require 'simplecov/t_wada'
  SimpleCov.formatter = SimpleCov::Formatter::TWada
  
  # You can customize AA and Message if you want
  SimpleCov::Formatter::TWada.aa      = '＼(^o^)／'
  SimpleCov::Formatter::TWada.message = '俺をこれ以上怒らせるんじゃねぇ'
end
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ysksn/simplecov-t_wada. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Simplecov::TWada project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ysksn/simplecov-t_wada/blob/master/CODE_OF_CONDUCT.md).

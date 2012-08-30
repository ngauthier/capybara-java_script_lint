# Capybara::JavaScriptLint

Uses `capybara-webkit` to run jslint on javascript files via the rails 3 asset pipeline.

## Installation

Add this line to your application's Gemfile:

    gem 'capybara-java_script_lint'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capybara-java_script_lint

## Usage

Create a file in your `test/integration` folder and make a JSLint testcase like:


```ruby
class JslintTest < Capybara::JavaScriptLint::TestCase
  options(
    white: true,
    undef: true,
    sloppy: true,
    vars: true,
    nomen: true,
    newcap: true,
    maxerr: 20
  )

  check 'application.js'
  check 'extensions.js'
  # etc...
end
```

It will load them by requesting `/assets/<file>` from the rails server.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

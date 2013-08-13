# FaradayMiddleware::ActiveSupportJson

Simple Faraday middleware that uses ActiveSupport::JSON to unobtrusively encode JSON requests and parse JSON responses.

## Installation

Add this line to your application's Gemfile:

    gem 'faraday_middleware-active_support_json'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install faraday_middleware-active_support_json

## Usage

The same as FaradayMiddleware::ParseJson:

```ruby
require 'faraday_middleware/active_support_json'

connection = Faraday.new do |conn|
  conn.request :active_support_json
  conn.response :active_support_json
  conn.adapter  Faraday.default_adapter
end

connection.get('http://example.com/example.json')

resp = connection.post 'http://example.com/example.json' do |req|
  req.body = {:hello => 'world'}
end
```

### Passing parser options

```ruby
conn.response :active_support_json, symbolize_keys: true
```

### Credits

This gem is a fork of [https://github.com/denro/faraday_middleware-multi_json](FaradayMiddleware::MultiJson)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# Emites Client

This is the official Ruby client for the [Emites](https://app.emites.com.br) API.

[![Gem Version](https://badge.fury.io/rb/emites-client.png)](https://rubygems.org/gems/emites-client)
[![Build Status](https://api.travis-ci.org/myfreecomm/emites-client-ruby.svg?branch=master)](https://travis-ci.org/myfreecomm/emites-client-ruby)
[![Test Coverage](https://codeclimate.com/github/myfreecomm/emites-client-ruby/badges/coverage.svg)](https://codeclimate.com/github/myfreecomm/emites-client-ruby)
[![Code Climate Grade](https://codeclimate.com/github/myfreecomm/emites-client-ruby/badges/gpa.svg)](https://codeclimate.com/github/myfreecomm/emites-client-ruby)

## Installation

Add this line to your application's Gemfile:

    gem 'emites-client', require: 'emites'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install emites-client

## Configuration

1. Use Emites.configure to setup your environment:

```ruby
require "emiter"

Emites.configure do |config|
  config.url = "https://sandbox.emites.com.br/api/v1" # defaults to "https://app.emites.com.br/api/v1"
  config.user_agent = 'My App v1.0' # optional, but you should pass a custom user-agent identifying your app
end
```
2. Add a new token in Emites account at https://app.emites.com.br/config/api

## Usage

##### Given your token, create an instance of Emites::Client, as below:

```ruby 
client = Emites.client("YOUR_TOKEN_HERE") 
```

##### Now you have access to every API endpoint:

* [Emitters API](http://myfreecomm.github.io/emites/sandbox/v1/modules/emitter.html) as `client.emitters`
* [Webhooks API](http://myfreecomm.github.io/emites/sandbox/v1/modules/webhook.html) as `client.webhooks`
* [NFSe API](http://myfreecomm.github.io/emites/sandbox/v1/modules/nfse.html) as `client.nfse`

### Endpoints

#### [Emitters](http://myfreecomm.github.io/emites/sandbox/v1/modules/emitter.html)

<table>
    <tr>
        <th>Endpoint</th>
        <th>Client method</th>
    </tr>
    <tr>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/emitter.html#criacao" target="_blank">
                POST /api/v1/emitters
            </a>
        </td>
        <td>
            client.emitters.create
        </td>
    </tr>
    <tr>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/emitter.html#detalhes" target="_blank">
                GET /api/v1/emitters/:id
            </a>
        </td>
        <td>
            client.emitters.info
        </td>
    </tr>
    <tr>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/emitter.html#listagem" target="_blank">
                GET /api/v1/emitters
            </a>
        </td>
        <td>
            client.emitters.list
        </td>
    </tr>
    <tr>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/emitter.html#filtros" target="_blank">
                GET /api/v1/emitters?cnpj=?cnpj
            </a>
        </td>
        <td>
            client.emitters.search
        </td>
    </tr>
    <tr>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/emitter.html#remocao" target="_blank">
                DELETE /api/v1/emitters/:id
            </a>
        </td>
        <td>
            client.emitters.destroy
        </td>
    </tr>
</table>

#### [Webhooks](http://myfreecomm.github.io/emites/sandbox/v1/modules/webhook.html)

#### [NFSe](http://myfreecomm.github.io/emites/sandbox/v1/modules/nfse.html)

## Contributing

1. Fork it ( https://github.com/myfreecomm/emites-client-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

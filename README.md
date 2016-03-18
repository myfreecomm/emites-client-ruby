# Emites Client

This is the official Ruby client for the [Emites](https://app.emites.com.br) API.

[![Gem Version](https://badge.fury.io/rb/emites-client.png)](https://rubygems.org/gems/emites-client)
[![Build Status](https://api.travis-ci.org/myfreecomm/emites-client-ruby.svg?branch=master)](https://travis-ci.org/myfreecomm/emites-client-ruby)
[![Test Coverage](https://codeclimate.com/github/myfreecomm/emites-client-ruby/badges/coverage.svg)](https://codeclimate.com/github/myfreecomm/emites-client-ruby)
[![Code Climate Grade](https://codeclimate.com/github/myfreecomm/emites-client-ruby/badges/gpa.svg)](https://codeclimate.com/github/myfreecomm/emites-client-ruby)
[![Inline docs](http://inch-ci.org/github/myfreecomm/emites-client-ruby.svg)](http://inch-ci.org/github/myfreecomm/emites-client-ruby)

## Installation

Add this line to your application's Gemfile:

    gem 'emites-client', require: 'emites'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install emites-client

## Configuration

##### Use Emites.configure to setup your environment:

```ruby
require "emites"

Emites.configure do |config|
  config.url = "https://sandbox.emites.com.br/api/v1" # defaults to "https://app.emites.com.br/api/v1"
  config.user_agent = 'My App v1.0' # optional, but you should pass a custom user-agent identifying your app
end
```
##### Create a new token in your Emites account: https://app.emites.com.br/config/api

## Usage

##### Given your token, create an instance of Emites::Client, as below:

```ruby
client = Emites.client("YOUR_TOKEN_HERE")
```

##### Now you have access to every API endpoint:

* [Emitters API](http://myfreecomm.github.io/emites/sandbox/v1/modules/emitter.html) as `client.emitters`
* [Takers API](http://myfreecomm.github.io/emites/sandbox/v1/modules/taker.html) as `client.takers`
* [Services API](http://myfreecomm.github.io/emites/sandbox/v1/modules/service_values.html) as `client.services`
* [Webhooks API](http://myfreecomm.github.io/emites/sandbox/v1/modules/webhooks.html) as `client.webhooks`
* [NFSe API](http://myfreecomm.github.io/emites/sandbox/v1/modules/nfse.html) as `client.nfse`

### Endpoints

#### [Emitters](http://myfreecomm.github.io/emites/sandbox/v1/modules/emitter.html)

<table>
    <tr>
        <th>HTTP method</th>
        <th>Endpoint</th>
        <th>Client method</th>
    </tr>
    <tr>
        <td><code>POST</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/emitter.html#criacao" target="_blank">
                /api/v1/emitters
            </a>
        </td>
        <td>
            <code>client.emitters.create</code>
        </td>
    </tr>
    <tr>
        <td><code>GET</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/emitter.html#listagem" target="_blank">
                /api/v1/emitters
            </a>
        </td>
        <td>
            <code>client.emitters.list</code>
        </td>
    </tr>
    <tr>
        <td><code>GET</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/emitter.html#detalhes" target="_blank">
                /api/v1/emitters/:id
            </a>
        </td>
        <td>
            <code>client.emitters.info</code>
        </td>
    </tr>
    <tr>
        <td><code>GET</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/emitter.html#filtros" target="_blank">
                /api/v1/emitters?cnpj=?:cnpj
            </a>
        </td>
        <td>
            <code>client.emitters.search</code>
        </td>
    </tr>
    <tr>
        <td><code>DELETE</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/emitter.html#remocao" target="_blank">
                /api/v1/emitters/:id
            </a>
        </td>
        <td>
            <code>client.emitters.destroy</code>
        </td>
    </tr>
</table>

#### [Takers](http://myfreecomm.github.io/emites/sandbox/v1/modules/taker.html)

<table>
    <tr>
        <th>HTTP method</th>
        <th>Endpoint</th>
        <th>Client method</th>
    </tr>
    <tr>
        <td><code>POST</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/taker.html#criacao" target="_blank">
                /api/v1/takers
            </a>
        </td>
        <td>
            <code>client.takers.create</code>
        </td>
    </tr>
    <tr>
        <td><code>GET</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/taker.html#listagem" target="_blank">
                /api/v1/takers
            </a>
        </td>
        <td>
            <code>client.takers.list</code>
        </td>
    </tr>
    <tr>
        <td><code>GET</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/taker.html#detalhes" target="_blank">
                /api/v1/takers/:id
            </a>
        </td>
        <td>
            <code>client.takers.info</code>
        </td>
    </tr>
    <tr>
        <td><code>GET</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/taker.html#filtros" target="_blank">
                /api/v1/takers?cnpj=:cnpj
            </a>
        </td>
        <td>
            <code>client.takers.search</code>
        </td>
    </tr>
    <tr>
        <td><code>DELETE</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/taker.html#remocao" target="_blank">
                /api/v1/takers/:id
            </a>
        </td>
        <td>
            <code>client.takers.destroy</code>
        </td>
    </tr>
</table>

#### [Services](http://myfreecomm.github.io/emites/sandbox/v1/modules/service_values.html)

<table>
    <tr>
        <th>HTTP method</th>
        <th>Endpoint</th>
        <th>Client method</th>
    </tr>
    <tr>
        <td><code>POST</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/service_values.html#criacao" target="_blank">
                /api/v1/service-values
            </a>
        </td>
        <td>
            <code>client.services.create</code>
        </td>
    </tr>
    <tr>
        <td><code>GET</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/service_values.html#listagem" target="_blank">
                /api/v1/service-values
            </a>
        </td>
        <td>
            <code>client.services.list</code>
        </td>
    </tr>
    <tr>
        <td><code>GET</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/service_values.html#detalhes" target="_blank">
                /api/v1/service-values/:id
            </a>
        </td>
        <td>
            <code>client.services.info</code>
        </td>
    </tr>
    <tr>
        <td><code>GET</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/service_values.html#filtros" target="_blank">
                /api/v1/service-values?name=:name
            </a>
        </td>
        <td>
            <code>client.services.search</code>
        </td>
    </tr>
    <tr>
        <td><code>DELETE</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/service_values.html#remocao" target="_blank">
                /api/v1/service-values/:id
            </a>
        </td>
        <td>
            <code>client.services.destroy</code>
        </td>
    </tr>
    <tr>
        <td><code>POST</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/service_values.html#calculo-de-valor-liquido-da-nfse" target="_blank">
                /api/v1/service-values/:id/calculation-liquid-amount
            </a>
        </td>
        <td>
            <code>client.services.calculate_liquid_amount</code>
        </td>
    </tr>
</table>

#### [Webhooks](http://myfreecomm.github.io/emites/sandbox/v1/modules/webhooks.html)

<table>
    <tr>
        <th>HTTP method</th>
        <th>Endpoint</th>
        <th>Client method</th>
    </tr>
    <tr>
        <td><code>POST</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/webhooks.html#criacao" target="_blank">
                /api/v1/webhooks
            </a>
        </td>
        <td>
            <code>client.webhooks.create</code>
        </td>
    </tr>
    <tr>
        <td><code>GET</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/webhooks.html#listagem" target="_blank">
                /api/v1/webhooks
            </a>
        </td>
        <td>
            <code>client.webhooks.list</code>
        </td>
    </tr>
    <tr>
        <td><code>PUT</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/webhooks.html#atualizacao" target="_blank">
                /api/v1/webhooks/:id
            </a>
        </td>
        <td>
            <code>client.webhooks.update</code>
        </td>
    </tr>
    <tr>
        <td><code>DELETE</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/webhooks.html#remocao" target="_blank">
                /api/v1/webhooks/:id
            </a>
        </td>
        <td>
            <code>client.webhooks.destroy</code>
        </td>
    </tr>
</table>

#### [NFSe](http://myfreecomm.github.io/emites/sandbox/v1/modules/nfse.html)

<table>
    <tr>
        <th>HTTP method</th>
        <th>Endpoint</th>
        <th>Client method</th>
    </tr>
    <tr>
        <td><code>POST</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/nfse.html#criacao" target="_blank">
                /api/v1/nfse
            </a>
        </td>
        <td>
            <code>client.nfse.create</code>
        </td>
    </tr>
    <tr>
        <td><code>GET</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/nfse.html#listagem" target="_blank">
                /api/v1/nfse
            </a>
        </td>
        <td>
            <code>client.nfse.list</code>
        </td>
    </tr>
    <tr>
        <td><code>GET</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/nfse.html#detalhes" target="_blank">
                /api/v1/nfse/:id
            </a>
        </td>
        <td>
            <code>client.nfse.info</code>
        </td>
    </tr>
    <tr>
        <td><code>GET</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/nfse.html#status" target="_blank">
                /api/v1/nfse/:id/status
            </a>
        </td>
        <td>
            <code>client.nfse.status</code>
        </td>
    </tr>
    <tr>
        <td><code>GET</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/nfse.html#historico" target="_blank">
                /api/v1/nfse/:id/history
            </a>
        </td>
        <td>
            <code>client.nfse.history</code>
        </td>
    </tr>
    <tr>
        <td><code>GET</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/nfse.html#pdf" target="_blank">
                /api/v1/nfse/:id/pdf
            </a>
        </td>
        <td>
            <code>client.nfse.pdf</code>
        </td>
    </tr>
    <tr>
        <td><code>GET</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/nfse.html#xml" target="_blank">
                /api/v1/nfse/:id/xml
            </a>
        </td>
        <td>
            <code>client.nfse.xml</code>
        </td>
    </tr>
    <tr>
        <td><code>POST</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/nfse.html#cancelamento" target="_blank">
                /api/v1/nfse/:id/cancel
            </a>
        </td>
        <td>
            <code>client.nfse.cancel</code>
        </td>
    </tr>
    <tr>
        <td><code>DELETE</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/nfse.html#remocao" target="_blank">
                /api/v1/nfse/:id
            </a>
        </td>
        <td>
            <code>client.nfse.destroy</code>
        </td>
    </tr>
    <tr>
        <td><code>PUT</code></td>
        <td>
            <a href="http://myfreecomm.github.io/emites/sandbox/v1/modules/nfse.html#atualizacao-parcial-e-completa" target="_blank">
                /api/v1/nfse/:id
            </a>
        </td>
        <td>
            <code>client.nfse.update</code>
        </td>
    </tr>
</table>

## Callbacks

All actions that change data triggers an event that you can subscribe to. This event allow you to extend the logic executed when you call a client method.

#### Subscribing to an event

All you have to do is create a class that responds to a method `#call` with two arguments:

```ruby
class MyListener
  def call(result, args)
  end
end
```

**Where:**

* `result` is the return of a client method
* `args` is an array of arguments passed to the client method you called

Now you have a listener, you can subscribe to an event:

```ruby
Emites.subscribe("emites.emitters.destroy", MyListener.new)
```

**Example:**

When you call `client.emitters.destroy(1)`, an event `emites.emitters.destroy` will be triggered. Your listener method `#call` will receive:

* `result` would be `true or false` - depending on what `client.emitters.destroy(1)` returned
* `args` would be `[1]` - an array with the arguments passed to the client method

#### Available hooks

<table>
    <tr>
        <th>Resource</th>
        <th>Events</th>
    </tr>
    <tr>
        <td><code>emitters</code></td>
        <td>
          <code>emites.emitters.create</code><br />
          <code>emites.emitters.destroy</code>
        </td>
    </tr>
    <tr>
        <td><code>takers</code></td>
        <td>
          <code>emites.takers.create</code><br />
          <code>emites.takers.destroy</code>
        </td>
    </tr>
    <tr>
        <td><code>services</code></td>
        <td>
          <code>emites.services.create</code><br />
          <code>emites.services.destroy</code>
        </td>
    </tr>
    <tr>
        <td><code>webhooks</code></td>
        <td>
          <code>emites.webhooks.create</code><br />
          <code>emites.webhooks.update</code><br />
          <code>emites.webhooks.destroy</code>
        </td>
    </tr>
    <tr>
        <td><code>nfse</code></td>
        <td>
          <code>emites.nfse.create</code><br />
          <code>emites.nfse.update</code><br />
          <code>emites.nfse.destroy</code><br />
          <code>emites.nfse.cancel</code>
        </td>
    </tr>
</table>

## Contributing

1. Fork it ( https://github.com/myfreecomm/emites-client-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

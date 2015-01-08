# Webhookr::Shopkeep
[![Dependency Status](https://gemnasium.com/zoocasa/webhookr-shopkeep.png)](https://gemnasium.com/zoocasa/webhookr-shopkeep)

This gem is a plugin for [Webhookr](https://github.com/zoocasa/webhookr) that enables
your application to accept [webhooks from Shopkeep](http://mailparser.io/blog/getting-started-mailparser-io-email-parser/).

## Installation

Add this line to your application's Gemfile:

    gem 'webhookr-shopkeep'

Or install it yourself:

    $ gem install webhookr-shopkeep

## Usage

Once you have the gem installed run the generator to add the code to your initializer.
An initializer will be created if you do not have one.

```console
rails g webhookr:shopkeep:init *initializer_name* -s
```

Run the generator to create an example file to handle ShopKeep webhooks.

```console
rails g webhookr:shopkeep:example_hooks
```

Or create a ShopKeep handler class for any event that you want to handle. For example
to handle unsubscribes you would create a class as follows:

```ruby
class ShopKeepHooks
  def on_unsubscribe(incoming)
    # Your custom logic goes here.
    User.unsubscribe_newletter(incoming.payload.data.email)
  end
end
```

For a complete list of events, and the payload format, see below.

Edit config/initializers/*initializer_name* and change the commented line to point to
your custom Shopkeep event handling class. If your class was called *ShopKeepHooks*
the configuration line would look like this:

```ruby
  Webhookr::Shopkeep::Adapter.config.callback = ShopKeepHooks
```

To see the list of ShopKeep URLs for your application can use run the provided webhookr rake task:

```console
rake webhookr:services
```

Example output:

```console
shopkeep:
  GET	/webhookr/events/shopkeep/19xl64emxvn
  POST	/webhookr/events/shopkeep/19xl64emxvn
```

## Mailparser.io Events & Payload

### Events

All webhook events are supported. 

<table>
  <tr>
    <th>Mailparser.io Event</th>
    <th>Event Handler</th>
  </tr>
  <tr>
    <td>event</td>
    <td>on_event(incoming)</td>
  </tr>
</table>

### Payload

The payload is the full payload data converted to an OpenStruct
for ease of access. 

```ruby
  incoming.payload

```

### <a name="supported_services"></a>Supported Service - Mailparser.io

* [http://apidocs.shopkeep.com/webhooks/](Mailparser.io)

## <a name="works_with"></a>Works with:

webhookr-shopkeep works with Rails 3.1, 3.2 and 4.0, and has been tested on the following Ruby
implementations:

* 1.9.3
* 2.0.0
* jruby-19mode

### Versioning
This library aims to adhere to [Semantic Versioning 2.0.0](http://semver.org/). Violations of this scheme should be reported as
bugs. Specifically, if a minor or patch version is released that breaks backward compatibility, that
version should be immediately yanked and/or a new version should be immediately released that restores
compatibility. Breaking changes to the public API will only be introduced with new major versions. As a
result of this policy, once this gem reaches a 1.0 release, you can (and should) specify a dependency on
this gem using the [Pessimistic Version Constraint](http://docs.rubygems.org/read/chapter/16#page74) with
two digits of precision. For example:

    spec.add_dependency 'webhookr-shopkeep', '~> 1.0'

While this gem is currently a 0.x release, suggestion is to require the exact version that works for your code:

    spec.add_dependency 'webhookr-shopkeep', '0.0.1'

## License

webhookr-shopkeep is released under the [MIT license](http://www.opensource.org/licenses/MIT).

## Author

Adapted from webhookr-mailchimp by 
* [Gerry Power](https://github.com/gerrypower)
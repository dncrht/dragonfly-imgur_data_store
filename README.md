# Dragonfly::ImgurDataStore

Imgur data store for use with the [Dragonfly](http://github.com/markevans/dragonfly) gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dragonfly-imgur_data_store'
```

And then execute:

```bash
$ bundle
```

## Usage

Configure dragonfly with Imgur credentials at `config/initializers/dragonfly.rb` as:

```ruby
datastore :imgur,
  client_id: 'CLIENT_ID',
  client_secret: 'CLIENT_SECRET',
  access_token: 'ACCESS_TOKEN',
  refresh_token: 'REFRESH_TOKEN'
```

The recommended way to serve an image is via `remote_url`.

```ruby
my_model.attachment.remote_url
```

Bear in mind that Imgur **only stores images**.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

Usually dragonfly datastores are easily tested thanks to a shared example:

```ruby
it_should_behave_like 'data_store'
```

as stated in the [documentation](http://markevans.github.io/dragonfly/data-stores). However ImgurDataStore cannot because that shared example uses a text file not allowed by Imgur.

You'll also need to create your own `config/imgur.yml` with the relevant credentials. Use the template file as a guide:

```bash
cp config/imgur.yml.SAMPLE config/imgur.yml
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dncrht/dragonfly-imgur_data_store.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

# MicroApi
This is a Rails plugin that would like to help the startup of rails applications oriented to microservices or, in general, application deployed on the cloud.

## Usage
How to use my plugin in a existing project
```bash
bundle add micro_api
```


```bash
gem install micro_api
```


## Installation
Add this line to your application's Gemfile:

```ruby
gem "micro_api"
```
from localpath
```ruby
gem 'micro_api', path: '/gems/micro_api'
```


And then execute:
```bash
bundle
bundle exec rails generate micro_api:install
```

Or install it yourself as:
```bash
$ gem install micro_api
```

## Implementation

### testing
```bash
docker run -ti --rm -v $(pwd):/app --workdir="/app" ruby:alpine sh
apk add --update build-base libxml2-dev libxslt-dev git postgresql-dev postgresql-client
bundle install
gem update --system
bundle exec rspec
bundle exec rubocop
bundle exec rubocop -A
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

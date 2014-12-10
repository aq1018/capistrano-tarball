# Capistrano::Tarball

**Note: this plugin works only with Capistrano 3.**

### About

Capistrano Tarball plugin allows the deployment of your apps via a tarball. This plugin does the following for you:

* Packages your source code / compiled binary into a tarball.
* Uploads the tarball to remote servers.
* Extract the tarball to `release_path`

### Installation

Put the following in your application's `Gemfile`:

```ruby
group :development do
  gem 'capistrano', '~> 3.2.0'
  gem 'capistrano-tarball'
end
```

Then:

```
$ bundle install
```

### Usage

Put the following in your application's `Capfile`:

```ruby
require 'capistrano/tarball'
```

Then set the `scm` to `tarball` in your `deploy.rb`:

```ruby
# Yeah, I know... tarball is not really a SCM, but trust me...
set :scm, :tarball
```

### Configurations

Please see: [defaults.rb](https://github.com/aq1018/capistrano-tarball/blob/master/lib/capistrano/tarball/defaults.rb)


### Contributing

1. Fork it ( https://github.com/[my-github-username]/capistrano-binary/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

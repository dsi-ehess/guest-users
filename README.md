# GuestUsers

Invite external users "on the fly" to Hyrax from sharing tab of works, collections and files.

## Usage

Activate the feature in Fliflop "settings" interface.

## Installation
Put the gem in your project's `vendor/gem` directory and add this line to your application's Gemfile:

```ruby
gem 'guest_users', path: 'vendor/gems/guest_users'
```

And then execute:
```bash
$ bundle install
```

Add required fields to database :

```bash
$ rails generate guest_users:install  copy_migrations
$ rails db:migrate
```

Enable feature in Flipflop :
```bash
$ rails generate guest_users:install add_feature
```
Add this line to your `routes.rb` :

```ruby
mount GuestUsers::Engine => "/guest_users"
```
Change this line in your `routes.rb`, from :

```ruby
devise_for :users
```
to :

```ruby
devise_for :users, class_name: 'GuestUsers::User'
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

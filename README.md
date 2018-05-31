# OpenGithubIssue

A simple mountable Rails engine to provide a secure way for users to report issues they see with the application. Useful
in QA and UAT environments. Minimal gem with no dependencies outside of Rails and Octokit.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'open_github_issue'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install open_github_issue
```

This engine requires mounting, e.g.:

```ruby
# config/routes.rb

mount OpenGithubIssue::Engine, on: '/ogi'
```

Include JavaScript in `app/assets/javascripts/application.js`:

```javascript
// = require 'open_github_issue'
```

Include default CSS in `app/assets/stylesheets/application.css` (or equivalent):

``` css
/*
* = require 'open_github_issue'
*/
```

Or, if you're using SCSS:

``` scss
@import('open_github_issue');
```

Finally, attach the form in your view:

``` erb
<%= open_github_issue_form %>
```

## Configuration

Build an initializer like this one (defaults presented where available):

```ruby
OpenGithubIssue.configure do |config|
  config.github_access_token = 'insert-token-here' # default: nil
  config.github_repo = 'paweljw/open_github_issue' # default: nil
  config.user_method = :current_user # default
  config.user_name_method = :email # default
  config.constraint = proc { |user| user } # default
end
```

### `github_access_token`

A personal access token (get one in the GitHub settings) with `repo` permissions.

### `github_repo`

Path to your GitHub repository (see above example).

### `user_method`

This is expected to exist on controllers where OpenGithubIssue is used. Passed to `constraint`. `user_name_method` is also
called on the result of this method. It can be `nil`; nothing will be passed to constraint and user names will not be attached
to reports. `current_user` used by default - if you're using Devise, you're all set.

### `user_name_method`

Attached to issue reports, transparently to the user reporting the issues. Useful for reporter identification purposes. Not
attached to reports if set to nil. `email` by default - if your current user responds to this, you're all set.

### `constraint`

Called to determine whether the user should be shown the option to report issues. For example, if you want to show the form
to all logged in users, `proc { |user| user }` will suffice, or `proc { |_| true }` if everyone should have the possibility.
You can screen this out by role with e.g. `proc { |user| user.qa? }`. If everyone should have access, but only in e.g. staging
environment, `proc { |_| Rails.env.staging? }` will come in handy.

## Customizing

This gem's behavior can be customized in several ways.

### The report form

The report form can be customized to fit in better with the design of your application. If you place a partial in
`app/views/application/_open_github_issue_form.html.erb`, it will take precedence over the built-in view.

### I18n

Localize this gem for your application using `config/locales/open_github_issue.en.yml` as reference. This gem is currently
localized in `:en` and `:pl` locales.

### Controller behavior

Define your own `OpenGithubIssue::ReportsController` using the one in `app/controllers/open_github_issue/reports_controller.rb`
as reference to customize behavior, e.g. redirects and flashes.

## TODO

- [ ] Proper specs
- [ ] Hook up CI (e.g. Travis CI)
- [ ] Hook up a linting service (e.g. CodeClimate)
- [ ] Drop unnecessary dev dependency on SQLite
- [ ] Add generators

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

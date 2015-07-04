[![Gem Version](https://badge.fury.io/rb/analytics-rails.svg)](http://badge.fury.io/rb/analytics-rails) [![Code Climate](https://codeclimate.com/github/museways/analytics-rails/badges/gpa.svg)](https://codeclimate.com/github/museways/analytics-rails) [![Build Status](https://travis-ci.org/museways/analytics-rails.svg?branch=master)](https://travis-ci.org/museways/analytics-rails) [![Dependency Status](https://gemnasium.com/museways/analytics-rails.svg)](https://gemnasium.com/museways/analytics-rails)

# Analytics Rails

Adds a simple helper to create the google analytics include tag.

## Install

Put this line in your Gemfile:
```ruby
gem 'analytics-rails'
```

Then bundle:
```
$ bundle
```

## Usage

In your layout add a line like this in your head:
```erb
<%= google_analytics_include_tag 'your-id' %>
```

You can add custom events:
```erb
<%= google_analytics_include_tag 'your-id', events: [['Popup', 'Click']] %>
```

And custom variables:
```erb
<%= google_analytics_include_tag 'your-id', variables: [[1, 'Member', 'Yes', 1]] %>
```

NOTE: Will only show the include tag in production environment.

## Credits

This gem is maintained and funded by [museways](http://museways.com).

## License

It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.

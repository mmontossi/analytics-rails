[![Gem Version](https://badge.fury.io/rb/analytics-rails.svg)](http://badge.fury.io/rb/analytics-rails)
[![Code Climate](https://codeclimate.com/github/mmontossi/analytics-rails/badges/gpa.svg)](https://codeclimate.com/github/mmontossi/analytics-rails)
[![Build Status](https://travis-ci.org/mmontossi/analytics-rails.svg)](https://travis-ci.org/mmontossi/analytics-rails)
[![Dependency Status](https://gemnasium.com/mmontossi/analytics-rails.svg)](https://gemnasium.com/mmontossi/analytics-rails)

# Analytics Rails

Adds a helper to create the google analytics script in rails.

## Why

I did this gem to:

- Have a simple but versatile way to include google analytics.

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

### Include

In your layout add a line like this in your head:
```erb
<%= google_analytics_include_tag 'id' %>
```

You can attach metrics if you want:
```erb
<%= google_analytics_include_tag 'id', metric: 'value' %>
```

### Events

After you included the main tag, you can add events:
```erb
<%= google_analytics_event_tag 'Video', 'play' %>
```

Only category and action is required, but you can send label, value and metris if you want:
```ruby
<%= google_analytics_event_tag 'Video', 'play', 'Fall Campaign', 42, metric: 'value' %>
```

NOTE: Tags will only show in production environment.

## Credits

This gem is maintained and funded by [mmontossi](https://github.com/mmontossi).

## License

It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.

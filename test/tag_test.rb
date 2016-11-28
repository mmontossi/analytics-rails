require 'test_helper'

class TagTest < ActionView::TestCase

  test 'arguments' do
    with_env 'production' do
      assert_includes(
        google_analytics_include_tag('id'),
        "ga('create', 'id', 'auto');"
      )
      assert_includes(
        google_analytics_include_tag(variables: [['quantity', 1]]),
        "ga('set', 'quantity', 1);"
      )
      assert_includes(
        google_analytics_include_tag(variables: [['product', 'guitar']]),
        "ga('set', 'product', 'guitar');"
      )
      assert_includes(
        google_analytics_include_tag(events: [['popup', 'click']]),
        "ga('send', 'event', 'popup', 'click');"
      )
    end

    with_env 'development' do
      assert_not google_analytics_include_tag
    end
  end

  private

  def with_env(value)
    old_env = Rails.env
    Rails.env = value
    yield
    Rails.env = old_env
  end

end

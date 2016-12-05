require 'test_helper'

class TagTest < ActionView::TestCase

  test 'include' do
    self.request = ActionController::TestRequest.new
    with_env 'production' do
      tag = google_analytics_include_tag('id')
      assert_includes tag, 'ga("create", "id", "auto");'
      assert_includes tag, 'ga("send", "pageview", {});'
      assert_includes tag, 'http://www.google-analytics.com/analytics.js'

      tag = google_analytics_include_tag('id', other: 'value')
      assert_includes tag, 'ga("create", "id", "auto");'
      assert_includes tag, 'ga("send", "pageview", {"other":"value"});'
      assert_includes tag, 'http://www.google-analytics.com/analytics.js'
    end

    with_env 'development' do
      assert_not google_analytics_include_tag
    end
  end

  test 'event' do
    with_env 'production' do
      assert_includes(
        google_analytics_event_tag('Popup', 'click'),
        'ga("send", "event", "Popup", "click", {});'
      )

      assert_includes(
        google_analytics_event_tag('Video', 'play', 'ad.mp4', 10, non_interactive: 'value'),
        'ga("send", "event", "Video", "play", "ad.mp4", 10, {"nonInteractive":"value"});'
      )
    end

    with_env 'development' do
      assert_not google_analytics_event_tag
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

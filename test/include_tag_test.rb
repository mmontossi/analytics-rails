require 'test_helper'

class IncludeTagTest < ActionView::TestCase

  test 'tag id' do
    with_env 'production' do
      assert google_analytics_include_tag('id').include?("_gaq.push(['_setAccount', 'id']);")
      assert google_analytics_include_tag(
        variables: [[1, 'Member', 'Yes', 1]]
      ).include?("_gaq.push(['_setCustomVar', 1, 'Member', 'Yes', 1])")
      assert google_analytics_include_tag(
        events: [['Popup', 'Click']]
      ).include?("ga('send', 'event', 'Popup', 'Click');")
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

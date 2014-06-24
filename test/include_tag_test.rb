require 'test_helper'

class IncludeTagTest < ActionView::TestCase

  test "should return include tag with id" do
    with_env 'production' do
      assert google_analytics_include_tag('id').include?("_gaq.push(['_setAccount', 'id']);")
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

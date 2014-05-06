require 'test_helper'

class IncludeTagTest < ActionView::TestCase

  test "should return include tag with id" do
    with_env 'production' do
      assert_equal "<script type=\"text/javascript\">var _gaq = _gaq || [];\n_gaq.push(['_setAccount', 'id']);\n_gaq.push(['_trackPageview']);\n(function(){\n  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;\n  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';\n  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);\n})();\n</script>", google_analytics_include_tag('id')
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

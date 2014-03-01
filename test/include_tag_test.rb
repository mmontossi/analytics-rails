require 'test_helper'

class IncludeTagTest < ActionDispatch::IntegrationTest

  test "should show include tag" do
    with_env 'production' do
      get '/'
      assert_response :success
      assert response.body.include?("<script type=\"text/javascript\">var _gaq = _gaq || [];\n_gaq.push(['_setAccount', 'your-id']);\n_gaq.push(['_trackPageview']);\n(function(){\n  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;\n  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';\n  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);\n})();\n</script>")
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

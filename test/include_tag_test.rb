require 'test_helper'

class IncludeTagTest < ActionDispatch::IntegrationTest

  test "should show include tag" do
    get '/'
    assert_response :success, 'request fail'
    assert response.body.include?("_gaq.push(['_setAccount', 'your-id']);"), 'no include tag'
  end

end

require 'test_helper'

class IncludeTagTest < ActionDispatch::IntegrationTest

  test "should show include tag" do
    get '/'
    assert_response :success
    assert response.body.include?("_gaq.push(['_setAccount', 'your-id']);")
  end

end

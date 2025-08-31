require "test_helper"

class MakesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get makes_show_url
    assert_response :success
  end
end

require "test_helper"

class WebcamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get webcams_index_url
    assert_response :success
  end
end

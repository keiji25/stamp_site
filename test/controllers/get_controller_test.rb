require "test_helper"

class GetControllerTest < ActionDispatch::IntegrationTest
  test "should get stamp" do
    get get_stamp_url
    assert_response :success
  end
end

require "test_helper"

class AdminimanagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get adminimanages_new_url
    assert_response :success
  end
end

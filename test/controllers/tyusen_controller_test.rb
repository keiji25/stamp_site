require "test_helper"

class TyusenControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tyusen_index_url
    assert_response :success
  end
end

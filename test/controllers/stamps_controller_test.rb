require "test_helper"

class StampsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stamp = stamps(:one)
  end

  test "should get index" do
    get stamps_url
    assert_response :success
  end

  test "should get new" do
    get new_stamp_url
    assert_response :success
  end

  test "should create stamp" do
    assert_difference('Stamp.count') do
      post stamps_url, params: { stamp: { image: @stamp.image, name: @stamp.name, stamp_id: @stamp.stamp_id } }
    end

    assert_redirected_to stamp_url(Stamp.last)
  end

  test "should show stamp" do
    get stamp_url(@stamp)
    assert_response :success
  end

  test "should get edit" do
    get edit_stamp_url(@stamp)
    assert_response :success
  end

  test "should update stamp" do
    patch stamp_url(@stamp), params: { stamp: { image: @stamp.image, name: @stamp.name, stamp_id: @stamp.stamp_id } }
    assert_redirected_to stamp_url(@stamp)
  end

  test "should destroy stamp" do
    assert_difference('Stamp.count', -1) do
      delete stamp_url(@stamp)
    end

    assert_redirected_to stamps_url
  end
end

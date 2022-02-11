require "application_system_test_case"

class StampsTest < ApplicationSystemTestCase
  setup do
    @stamp = stamps(:one)
  end

  test "visiting the index" do
    visit stamps_url
    assert_selector "h1", text: "Stamps"
  end

  test "creating a Stamp" do
    visit stamps_url
    click_on "New Stamp"

    fill_in "Image", with: @stamp.image
    fill_in "Name", with: @stamp.name
    fill_in "Stamp", with: @stamp.stamp_id
    click_on "Create Stamp"

    assert_text "Stamp was successfully created"
    click_on "Back"
  end

  test "updating a Stamp" do
    visit stamps_url
    click_on "Edit", match: :first

    fill_in "Image", with: @stamp.image
    fill_in "Name", with: @stamp.name
    fill_in "Stamp", with: @stamp.stamp_id
    click_on "Update Stamp"

    assert_text "Stamp was successfully updated"
    click_on "Back"
  end

  test "destroying a Stamp" do
    visit stamps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stamp was successfully destroyed"
  end
end

require "application_system_test_case"

class SiteInfosTest < ApplicationSystemTestCase
  setup do
    @site_info = site_infos(:one)
  end

  test "visiting the index" do
    visit site_infos_url
    assert_selector "h1", text: "Site Infos"
  end

  test "creating a Site info" do
    visit site_infos_url
    click_on "New Site Info"

    fill_in "Ip add", with: @site_info.ip_add
    click_on "Create Site info"

    assert_text "Site info was successfully created"
    click_on "Back"
  end

  test "updating a Site info" do
    visit site_infos_url
    click_on "Edit", match: :first

    fill_in "Ip add", with: @site_info.ip_add
    click_on "Update Site info"

    assert_text "Site info was successfully updated"
    click_on "Back"
  end

  test "destroying a Site info" do
    visit site_infos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Site info was successfully destroyed"
  end
end

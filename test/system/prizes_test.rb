require "application_system_test_case"

class PrizesTest < ApplicationSystemTestCase
  setup do
    @prize = prizes(:one)
  end

  test "visiting the index" do
    visit prizes_url
    assert_selector "h1", text: "Prizes"
  end

  test "creating a Prize" do
    visit prizes_url
    click_on "New Prize"

    fill_in "Prize", with: @prize.prize
    fill_in "Student no", with: @prize.student_no
    click_on "Create Prize"

    assert_text "Prize was successfully created"
    click_on "Back"
  end

  test "updating a Prize" do
    visit prizes_url
    click_on "Edit", match: :first

    fill_in "Prize", with: @prize.prize
    fill_in "Student no", with: @prize.student_no
    click_on "Update Prize"

    assert_text "Prize was successfully updated"
    click_on "Back"
  end

  test "destroying a Prize" do
    visit prizes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Prize was successfully destroyed"
  end
end

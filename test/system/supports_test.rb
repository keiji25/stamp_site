require "application_system_test_case"

class SupportsTest < ApplicationSystemTestCase
  setup do
    @support = supports(:one)
  end

  test "visiting the index" do
    visit supports_url
    assert_selector "h1", text: "Supports"
  end

  test "creating a Support" do
    visit supports_url
    click_on "New Support"

    fill_in "Answer", with: @support.answer
    fill_in "Kind", with: @support.kind
    fill_in "Order", with: @support.order
    fill_in "Question", with: @support.question
    click_on "Create Support"

    assert_text "Support was successfully created"
    click_on "Back"
  end

  test "updating a Support" do
    visit supports_url
    click_on "Edit", match: :first

    fill_in "Answer", with: @support.answer
    fill_in "Kind", with: @support.kind
    fill_in "Order", with: @support.order
    fill_in "Question", with: @support.question
    click_on "Update Support"

    assert_text "Support was successfully updated"
    click_on "Back"
  end

  test "destroying a Support" do
    visit supports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Support was successfully destroyed"
  end
end

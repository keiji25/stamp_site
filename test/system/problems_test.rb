require "application_system_test_case"

class ProblemsTest < ApplicationSystemTestCase
  setup do
    @problem = problems(:one)
  end

  test "visiting the index" do
    visit problems_url
    assert_selector "h1", text: "Problems"
  end

  test "creating a Problem" do
    visit problems_url
    click_on "New Problem"

    fill_in "Answer", with: @problem.answer
    fill_in "Place", with: @problem.place
    fill_in "Point", with: @problem.point
    fill_in "Problem code", with: @problem.problem_code
    fill_in "Problem statement", with: @problem.problem_statement
    fill_in "Select 1", with: @problem.select_1
    fill_in "Select 2", with: @problem.select_2
    fill_in "Select 3", with: @problem.select_3
    fill_in "Select 4", with: @problem.select_4
    click_on "Create Problem"

    assert_text "Problem was successfully created"
    click_on "Back"
  end

  test "updating a Problem" do
    visit problems_url
    click_on "Edit", match: :first

    fill_in "Answer", with: @problem.answer
    fill_in "Place", with: @problem.place
    fill_in "Point", with: @problem.point
    fill_in "Problem code", with: @problem.problem_code
    fill_in "Problem statement", with: @problem.problem_statement
    fill_in "Select 1", with: @problem.select_1
    fill_in "Select 2", with: @problem.select_2
    fill_in "Select 3", with: @problem.select_3
    fill_in "Select 4", with: @problem.select_4
    click_on "Update Problem"

    assert_text "Problem was successfully updated"
    click_on "Back"
  end

  test "destroying a Problem" do
    visit problems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Problem was successfully destroyed"
  end
end

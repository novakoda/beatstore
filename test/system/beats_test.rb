require "application_system_test_case"

class BeatsTest < ApplicationSystemTestCase
  setup do
    @beat = beats(:one)
  end

  test "visiting the index" do
    visit beats_url
    assert_selector "h1", text: "Beats"
  end

  test "creating a Beat" do
    visit beats_url
    click_on "New Beat"

    fill_in "Price", with: @beat.price
    fill_in "Scale", with: @beat.scale
    fill_in "Tempo", with: @beat.tempo
    fill_in "Title", with: @beat.title
    click_on "Create Beat"

    assert_text "Beat was successfully created"
    click_on "Back"
  end

  test "updating a Beat" do
    visit beats_url
    click_on "Edit", match: :first

    fill_in "Price", with: @beat.price
    fill_in "Scale", with: @beat.scale
    fill_in "Tempo", with: @beat.tempo
    fill_in "Title", with: @beat.title
    click_on "Update Beat"

    assert_text "Beat was successfully updated"
    click_on "Back"
  end

  test "destroying a Beat" do
    visit beats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Beat was successfully destroyed"
  end
end

require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  test "Going to root gives us a new random grid to play with" do
    visit root_url
    assert test: "New game"
    assert_selector ".letter", count: 10
    save_and_open_screenshot
  end

  test "filling the form with a word that does not contain the given letters and submiting it" do
    visit root_url
    fill_in "input_answer", with: "universality"
    click_on "Play"
    assert_text "can't be built out of"
    save_and_open_screenshot
  end

  test "filling the form with an unexistent English word" do
    visit root_url
    fill_in "input_answer", with: "ksjandls"
    click_on "Play"
    assert_text "doesn't seem to be a valid Englsih word"
    save_and_open_screenshot
  end

  # test "filling the form wit a valid word that contains the given letters" do
  #   visit root_url
  #   fill_in "input_answer", with: "??"
  #   click_on "Play"
  #   assert_text "Congratulations!!"
  #   save_and_open_screenshot
  # end





end

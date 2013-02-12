require "spec_helper"

describe "Survey pages" do

  def take_survey
    visit new_survey_path
    fill_in "Favorite celeb", with: "Ned Ruggeri"
    fill_in "Age", with: 17
    fill_in "Fav cat meme", with: 3
    fill_in "Most embarassing moment", with: "This is embarrassing"
    click_button "Create survey"
  end

end
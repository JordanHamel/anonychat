require "spec_helper"

describe "Topic pages" do

  def fill_out_form
    visit new_topic_path
    fill_in "Title", with: "The title"
    fill_in "Description", with: "The description"
    click_button "Create Topic"
  end

  context "with valid info" do
    it "should increase topic count by 1" do
      expect{ fill_out_form }.to change(Topic, :count).by(1)
    end

    it "should redirect to the topic page" do
      fill_out_form
      current_path.should =~ Regexp.new('topics/\d+')
    end
  end

  context "with invalid info" do
    it "should not add a topic to the database" do
      expect do
        visit new_topic_path
        click_button "Create Topic"
      end.to_not change(Topic, :count)
    end
  end
end
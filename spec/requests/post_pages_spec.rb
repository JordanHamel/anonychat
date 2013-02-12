require 'spec_helper'

describe "Post pages" do
  let(:t) { Topic.create(title: "tester") }

  def fill_in_info
    visit new_topic_post_path(t)
    fill_in "Title", with: "title"
    fill_in "Body", with: "description"
    click_button "Create Post"
  end

  context "with valid info" do
    it "should increase post count by 1" do
      expect { fill_in_info }.to change(Post, :count).by(1)
    end

    it "should redirect to post page" do
      fill_in_info
      current_path.should =~ Regexp.new('/posts/\d+')
    end
  end

  context "with invalid info" do
    it "should not increase post count" do
      expect do
        visit new_topic_post_path(t)
        click_button "Create Post"
      end.to_not change(Post, :count)
    end
  end
end
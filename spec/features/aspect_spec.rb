require 'rails_helper'

feature 'Visit an idea Define tab ' do
  before(:each) do
    @idea = FactoryGirl.create(:idea, phase: 1)
		@aspect = FactoryGirl.create(:aspect, title: "Problems & Solutions")
    @photo_aspect = FactoryGirl.create(:aspect, title: "Image")
    sign_in
    visit idea_path(@idea)
    click_link "Define"
  end

  scenario 'and see a default aspect' do
    page.should have_content "Problems & Solutions"
  end

  scenario 'and submit a solution', js: true do
    click_link @aspect.title
    click_link "Add solution"
    within(".solutions") do
      fill_in "Brief", with: "This is an example solution"
      click_button "Create Solution"
    end
    page.should have_content @idea.brief
    page.should have_content @aspect.title
    page.should have_content "This is an example solution"
  end

  scenario 'and submit a photo' do
    image = "/spec/support/default.png"
    click_link @photo_aspect.title
    click_link "Add solution"
    fill_in "Brief", with: "This is an image title"
    attach_file('Image', File.join(Rails.root, image))
    click_button "Create Solution"
  end

  scenario 'and submits a comment', js: true do
    click_link @aspect.title
    submit_solution "Valid solution"
    submit_comment "My comment", ".solutions li:first-child"
    page.should have_content "Valid solution"
    page.should have_content "My comment"
  end

  scenario 'and submits a comment', js: true do
    click_link @aspect.title
    submit_solution "Valid solution"
    submit_comment "My comment", ".solutions li:first-child"
    submit_comment "Reply to my comment", ".comments li:first-child", 'Reply to comment'
    page.should have_content "Valid solution"
    page.should have_content "Reply to my comment"
  end


  scenario 'and see solution counts' do
    click_link @aspect.title
    submit_solution "Valid solution"
    click_link "Define"
    page.should have_content "1 Solution"

    click_link @aspect.title
    submit_solution "Valid solution #2"
    click_link "Define"
    page.should have_content "2 Solutions"
  end

  scenario 'and automatically follows the idea upon solution submission' do
    click_link @aspect.title
    submit_solution "This is an example solution"
    page.should have_css ".unfollow-idea-button"
  end

end

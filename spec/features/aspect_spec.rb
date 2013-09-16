require 'spec_helper'

feature 'Visit an idea Define tab ' do
    before(:each) do
      @idea = FactoryGirl.create(:idea)
			@aspect = FactoryGirl.create(:aspect, title: "Problems & Solutions")
			sign_in
      visit url_for @idea
      click_link "Define"
    end

    scenario 'and see a default aspect' do
      page.should have_content "Problems & Solutions"
    end

    scenario 'and submit a solution' do
      click_link @aspect.title
      click_link "Add solution"
      fill_in "Brief", with: "This is an example solution"
      click_button "Create Solution"
      page.should have_content @idea.brief
      page.should have_content @aspect.title
      page.should have_content "This is an example solution"
    end

    scenario 'and submits a comment' do
      click_link @aspect.title
      submit_solution "Valid solution"
      submit_comment "My comment", ".solutions li:first-child"
      page.should have_content "Valid solution"
      page.should have_content "My comment"
    end

    scenario 'and submits a comment' do
      click_link @aspect.title
      submit_solution "Valid solution"
      submit_comment "My comment", ".solutions li:first-child"
      submit_comment "Reply to my comment", ".comments li:first-child", 'Reply to comment'
      page.should have_content "Valid solution"
      page.should have_content "Reply to my comment"
    end
end

require 'spec_helper'

feature 'User can', js: true do
  scenario 'follow an idea' do
    sign_in
    @idea = FactoryGirl.create(:idea)
    visit "/ideas/#{@idea.id}"
    page.find('.follow-idea-button').click
    page.should have_css ".unfollow-idea-button"
  end
  scenario 'unfollow an idea' do
    sign_in
    @idea = FactoryGirl.create(:idea)
    visit "/ideas/#{@idea.id}"
    click_button "Follow"
    page.find('.unfollow-idea-button').click
    page.should have_css ".follow-idea-button"
  end
end

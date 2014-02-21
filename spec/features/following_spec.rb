require 'spec_helper'

feature 'User can', js: true do

  before(:each)  do
    @user = sign_in
    @idea = FactoryGirl.create(:idea)
    visit "/ideas/#{@idea.id}"
    page.find('.follow-idea-button').click
  end
  scenario 'follow an idea' do
    page.should have_css ".unfollow-idea-button"
  end

  scenario 'unfollow an idea' do
    page.find('.unfollow-idea-button').click
    page.should have_css ".follow-idea-button"
  end

  scenario 'see followers on reputation overview page' do
    click_link "Reputation"
    find(".idea-followers").should have_content @user.name
  end
end

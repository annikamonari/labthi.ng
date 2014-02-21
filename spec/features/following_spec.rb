require 'spec_helper'

feature 'User can' do
  scenario 'follow an idea' do
    sign_in
    @idea = FactoryGirl.create(:idea)
    visit url_for(@idea)
    click_button("Follow")
    page.should have_content "Unfollow"
  end
  scenario 'unfollow an idea' do
    sign_in
    @idea = FactoryGirl.create(:idea)
    visit url_for(@idea)
    click_button("Follow")
    click_button("Unfollow")
    page.should have_content "Follow"
  end
end

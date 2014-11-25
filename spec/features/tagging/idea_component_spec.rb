require 'rails_helper'

feature 'Idea Component' do
  before(:each) do
    sign_in
    visit '/ideas/new'
    fill_in 'Brief', with: 'Valid Brief'
    select 'Science & Technology', :from => 'idea_category_list'
  end
  scenario 'User selects a type' do
    check 'Website'
    click_button 'Create Idea'
    page.should have_content('Website')
  end
  scenario 'User selects three types' do
    check 'Website'
    check 'App'
    check 'Service'
    click_button 'Create Idea'
    page.should have_content('Website')
    page.should have_content('App')
    page.should have_content('Service')
  end
  scenario 'User does not select a type' do
    click_button 'Create Idea'
    page.should have_content("Component list can't be blank")
  end
end
require 'spec_helper'

feature 'Categories' do
  before(:each) do
    sign_in
    visit '/ideas/new'
    fill_in 'Brief', with: 'Valid Brief'
    check 'Website'
  end
  scenario 'User tags an idea with a category' do
    select 'Science & Technology', :from => 'idea_category_list'
    click_button 'Create Idea'
    page.should have_content('Science & Technology')
  end
  scenario 'User does not select a category' do
    click_button 'Create Idea'
    page.should have_content("Category list can't be blank")
  end
  scenario 'User tags an idea with 4 categories' do
    select 'Retail', :from => 'idea_category_list'
    select 'Other', :from => 'idea_category_list'
    select 'Education', :from => 'idea_category_list'
    select 'Science & Technology', :from => 'idea_category_list'
    click_button 'Create Idea'
    page.should have_content("Please select only three categories")
  end
end
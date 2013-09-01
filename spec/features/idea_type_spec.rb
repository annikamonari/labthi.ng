require 'spec_helper'

feature 'Idea Type' do
  scenario 'User selects a type' do
    submit_idea
    select 'Science & Technology', :from => 'idea_category_list'
    select 'Website', :from => 'idea_component_list'
    click_button 'Update Idea'
    page.should have_content('Website')
  end
  scenario 'User selects three types' do
    submit_idea
    select 'Science & Technology', :from => 'idea_category_list'
    select 'Website', :from => 'idea_component_list'
    select 'App', :from => 'idea_component_list'
    select 'Service', :from => 'idea_component_list'
    click_button 'Update Idea'
    page.should have_content('Website')
    page.should have_content('App')
    page.should have_content('Service')
  end
  scenario 'User does not select a type' do
    submit_idea
    select 'Science & Technology', :from => 'idea_category_list'
    click_button 'Update Idea'
    page.should have_content("Component list can't be blank")
  end
end
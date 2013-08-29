require 'spec_helper'

feature 'Categories' do
  scenario 'User tags an idea with a category' do
    submit_idea
    select 'Science & Technology', :from => 'Categories'
    update_idea
    page.should have_content('Science & Technology')
  end
end
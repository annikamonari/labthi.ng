require 'spec_helper'

feature 'User updates an idea' do
  scenario 'with a category' do
    submit_idea
    select 'Science & Technology', :from => 'Categories'
    update_idea
    page.should have_content('Science & Technology')
  end
end
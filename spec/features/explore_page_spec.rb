require 'spec_helper'

feature 'User visits explore page' do
    before(:each) do
      visit '/'
      click_link 'Explore'
    end

  scenario 'and submits an idea' do
    click_link 'Submit Idea'
    fill_in 'Brief', with: 'valid brief'
    click_button 'Create Idea'
    update_idea
  end

end
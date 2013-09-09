require 'spec_helper'

feature 'User visits dashboard page' do
  scenario 'after signing up' do
  	sign_up_with 'email@example.com', "Dr. Example User", 'lkn521%@5n'
    expect(page).to have_content "My labs"
  end
  scenario 'and see recent activity' do
  	submit_idea 'Ant farm made out of ice'
  	click_link 'Labthi.ng'
  	page.should have_content "created an idea Ant farm made out of ice"
  end
end
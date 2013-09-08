require 'spec_helper'

feature 'User visits dashboard page' do
  scenario 'after signing up' do
  	sign_up_with 'email@example.com', "Dr. Example User", 'lkn521%@5n'
    expect(page).to have_content "My labs"
  end
end
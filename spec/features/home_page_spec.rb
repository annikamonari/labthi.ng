require 'rails_helper'

feature 'User visits home page' do
	before(:each) do
		visit '/'
	end
  scenario 'and signs up' do
	  fill_in 'Email', with: 'email@example.com'
	  fill_in 'First Name', with: 'Example'
	  fill_in 'Last Name', with: 'Name'
	  fill_in 'Password', with: 'ThisIsAPassword123$$$'
	  click_button 'Sign up'

    expect(page).to have_content('Sign out')
  end
end
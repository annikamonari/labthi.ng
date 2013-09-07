require 'spec_helper'

feature 'User visits home page' do
	before(:each) do
		visit '/'
	end
  scenario 'and signs up' do
	  fill_in 'Email', with: 'email@example.com'
	  fill_in 'Name', with: 'Example Name'
	  fill_in 'Password', with: 'ThisIsAPassword123$$$'
	  fill_in 'Password confirmation', with: 'ThisIsAPassword123$$$'
	  click_button 'Register'

    expect(page).to have_content('Sign out')
  end
end
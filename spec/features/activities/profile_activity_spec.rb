require 'rails_helper'

feature 'Visitor checks activity stream' do
  scenario 'for a recently updated profile' do
  	@user = sign_in
  	click_link @user.name
  	click_link "Edit"
  	click_button 'Update Profile'
    visit '/activities/index'
    expect(page).to have_content(@user.name + " 0 updated profile information")
  end
end
require 'spec_helper'

feature 'Guest visits a profile page' do 
  before(:each) do
    @user = sign_in
    click_link "Profile"
    fill_in 'Profession', with: 'Marketing Director'
    click_button "Update Profile"
    sign_out
  end
  scenario 'to view it' do
    visit url_for(@user.profile)
    expect(page).to have_content 'Marketing Director'
  end
  scenario 'to edit it' do
  	@user2 = sign_in
    visit url_for(@user.profile) + '/edit/'
    expect(page).to_not have_content 'Edit Profile'
  end
end
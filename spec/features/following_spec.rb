require 'spec_helper'

feature 'User follows another user' do
	before :each do
		
	end
  scenario 'and sees button text change' do
    sign_in
    @user2 = FactoryGirl.create(:user)
    visit url_for(@user2.profile)
    click_link "Follow"
    page.should have_content "Following"
  end
end
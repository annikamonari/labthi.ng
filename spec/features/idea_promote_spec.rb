require 'spec_helper'

feature 'promote an idea' do
	before (:each) do
		@idea  = FactoryGirl.create(:idea)
		@user  = FactoryGirl.create(:user)
		@user1 = FactoryGirl.create(:user, :admin => true)
	end

	scenario "only an admin can promote an idea" do
		sign_in @user1
		visit url_for(@idea)
		click_link "Promote"
		@idea.reload
		expect(@idea.phase).to be 2
	end

	scenario "and a user cannot" do
		sign_in @user 
		visit url_for(@idea)
		expect(page).not_to have_selector(:link_or_button, 'Promote')
	end
end
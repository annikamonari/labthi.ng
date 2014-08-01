require 'spec_helper'

feature 'promote an idea' do
	before (:each) do
		@idea = FactoryGirl.create(:idea)
		@user = FactoryGirl.create(:admin_user)
		sign_in @user
	end

	it "promotes an idea" do
		visit url_for(@idea)
		click_link "Promote"
		@idea.reload
		expect(@idea.phase).to be 2
	end
end
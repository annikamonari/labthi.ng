require 'spec_helper'

feature 'promote an idea' do
	before (:each) do
		@user  = FactoryGirl.create(:user)
		@idea  = FactoryGirl.create(:idea, user_id: @user.id, create_days: Date.today, phase: 1)
	end

	scenario 'automatically' do
		sign_in @user
		visit "/ideas/#{@idea.id}"
		@idea.phase.should eq(2)
	end
	
end
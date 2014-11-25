require 'rails_helper'

feature 'promote an idea' do
	before (:each) do
		@user  = FactoryGirl.create(:user)
		@idea  = FactoryGirl.create(:idea, user_id: @user.id, create_days: Date.today)
	end

	scenario 'automatically when create phase ends' do
		sign_in @user
		visit idea_path(@idea)
		expect(@idea.phase).to eq(2)
	end
	
end
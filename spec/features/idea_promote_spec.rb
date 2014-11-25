require 'rails_helper'

feature 'promote an idea' do
	before (:each) do
		@user  = FactoryGirl.create(:user)
		@idea  = FactoryGirl.create(:idea, create_days: Date.today+1.days)
	end
	
end
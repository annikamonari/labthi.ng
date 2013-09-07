require 'spec_helper'

feature 'User visits an idea page' do
	before(:each) do
		submit_idea

	end
  scenario 'and clicks "Define"' do
  	click_link 'Define'
  end
  scenario 'and clicks "Direct"' do
  	click_link 'Direct'
  end
=begin
  scenario 'and clicks "Reputation"' do
  	click_link 'Reputation'
  end
  scenario 'and clicks "Activity"' do
  	click_link 'Activity'
  end
=end
end
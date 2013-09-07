require 'spec_helper'

feature 'User visits an idea page' do
	before(:each) do
		submit_idea

	end
  scenario 'and clicks "Define"' do
    greeting = 'Fill in aspects of the Startup Business Canvas'
  	click_link 'Define'
    page.should have_content(greeting)
  end
  scenario 'and clicks "Direct"' do
    greeting = 'Critique, expand, and improve this idea!'
  	click_link 'Direct'
    page.should have_content(greeting)
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
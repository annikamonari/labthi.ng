require 'spec_helper'

feature 'User visits an idea page' do
	before(:each) do
		submit_idea
 	end
  
  scenario 'and clicks "Define"' do
    greeting = 'Fill in aspects of the Lean Startup Business Canvas'
  	click_link 'Define'
    page.should have_content(greeting)
  end
  scenario 'and clicks "Direct"' do
    greeting = 'Critique, expand, and improve this idea!'
  	click_link 'Direct'
    page.should have_content(greeting)
  end
  scenario 'and clicks "Reputation"' do
    greeting = 'See a list of the top 5 contributors!'
  	click_link 'Reputation'
    page.should have_content(greeting)
  end
  scenario 'and clicks "Activity"' do
    greeting = 'Recent activity'
  	click_link 'Activity'
    page.should have_content(greeting)
  end
end
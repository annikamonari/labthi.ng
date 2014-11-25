require 'rails_helper'

feature 'Visitor checks activity stream' do

	before(:each) do
		sign_in
  	@aspect = FactoryGirl.create(:aspect)
  	@idea = FactoryGirl.create(:idea)
  	visit url_for(@idea)
  	click_link "Define"
  	click_link @aspect.title
    submit_solution "Scrap everything and start over"
	end

  scenario 'for a recently added solution' do
    visit '/activities/index'
    expect(page).to have_content("Scrap everything and start over")
  end
end

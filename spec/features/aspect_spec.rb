require 'spec_helper'

feature 'Visit an idea Define tab ' do
    before(:each) do
      @idea = FactoryGirl.create(:idea)
			@aspect = FactoryGirl.create(:aspect, title: "Problems & Solutions")
      visit url_for @idea
      click_link "Define"
    end

    scenario 'and see a default aspect' do
      page.should have_content "Problems & Solutions"
    end
end

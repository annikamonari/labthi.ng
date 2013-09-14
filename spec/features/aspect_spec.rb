require 'spec_helper'

feature 'Aspects' do
    before(:each) do
      @idea = FactoryGirl.create(:idea)
			FactoryGirl.create(:aspect, brief: "Problems & Solutions")
    end

    scenario 'appear on the idea Define tab' do
      visit url_for @idea
      click_link "Define"
      page.should have_content "Problems & Solutions"
    end
end

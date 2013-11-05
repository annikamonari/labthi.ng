require 'spec_helper'

feature 'Visitor gets reputation from' do
  before(:each) do
  	sign_in
  end

  scenario 'upvoting an idea' do
  	@idea = FactoryGirl.create(:idea)
    visit idea_path @idea
    click_link "vote-down-idea-#{@idea.id}"
    find('.show-user-profile a').click
    find(".rep-points").should have_content '-10'
  end
end

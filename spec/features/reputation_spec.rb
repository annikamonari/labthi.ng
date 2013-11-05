require 'spec_helper'

feature 'Visitor gets reputation from' do
  before(:each) do
  end

  scenario 'submiting an idea' do
    submit_idea
    find('.show-user-profile a').click
    find(".rep-points").should have_content '10'
  end
  scenario 'writing a question' do
  	@idea = FactoryGirl.create(:idea)
  	sign_in
  	visit idea_path @idea
  	submit_question
    find('.show-user-profile a').click
    find(".rep-points").should have_content '3'
  end
end

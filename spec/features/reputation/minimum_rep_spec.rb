require 'spec_helper'

feature 'Visitor loses reputation' do
  before(:each) do
  	sign_in
  end

  scenario 'from downvoting a question' do
    find('.show-user-profile a').click
  	@question = FactoryGirl.create(:question)
    visit question_path @question
    click_link "vote-down-question-#{@question.id}"
    find('.show-user-profile a').click
    find(".sidebar .rep-points").should have_content '0'
  end
end

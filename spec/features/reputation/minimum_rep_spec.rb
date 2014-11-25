require 'rails_helper'

feature 'Visitor maintains minimum reputation' do
  before(:each) do
  	sign_in
  end

  scenario 'after downvoting a question' do
    find('.show-user-profile a').click
  	@question = FactoryGirl.create(:question)
    visit question_path @question
    click_link "vote-down-question-#{@question.id}"
    find('.show-user-profile a').click
    find(".badge-rep").should have_content '0'
  end
end

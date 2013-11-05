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
  scenario 'writing a question' do
  	@question = FactoryGirl.create(:question)
  	visit idea_path @question.idea
    click_link "vote-down-question-#{@question.id}"
    find('.show-user-profile a').click
    find(".rep-points").should have_content '-3'
  end
=begin
  scenario 'writing an answer' do
  	@question = FactoryGirl.create(:question)
  	visit question_path @question
  	submit_answer("valid answer")
    find('.show-user-profile a').click
    find(".rep-points").should have_content '5'
  end
  scenario 'writing a solution' do
  	@idea = FactoryGirl.create(:idea)
  	@aspect = FactoryGirl.create(:aspect)
  	visit idea_aspect_path @idea, @aspect
  	submit_solution("valid answer")
    find('.show-user-profile a').click
    find(".rep-points").should have_content '5'
  end
  scenario 'writing a comment' do
  	@question = FactoryGirl.create(:question)
  	visit question_path @question
	  submit_comment "sample comment", '.question'
    find('.show-user-profile a').click
    find(".rep-points").should have_content '1'
  end
=end
end

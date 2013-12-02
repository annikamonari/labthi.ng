require 'spec_helper'

feature 'Visitor gets reputation from' do
  before(:each) do
  	sign_in
  end

  scenario 'submiting an idea' do
  	sign_out
    submit_idea
    find('.show-user-profile a').click
    find(".sidebar .rep-points").should have_content '10'
  end
  scenario 'writing a question' do
  	@idea = FactoryGirl.create(:idea)
  	visit idea_path @idea
  	submit_question
    find('.show-user-profile a').click
    find(".sidebar .rep-points").should have_content '5'
  end
  scenario 'writing an answer' do
  	@question = FactoryGirl.create(:question)
  	visit question_path @question
  	submit_answer("valid answer")
    find('.show-user-profile a').click
    find(".sidebar .rep-points").should have_content '10'
  end
  scenario 'writing a solution' do
  	@idea = FactoryGirl.create(:idea)
  	@aspect = FactoryGirl.create(:aspect)
  	visit idea_aspect_path @idea, @aspect
  	submit_solution("valid answer")
    find('.show-user-profile a').click
    find(".sidebar .rep-points").should have_content '10'
  end
  scenario 'writing a comment' do
  	@question = FactoryGirl.create(:question)
  	visit question_path @question
	  submit_comment "sample comment", '.question'
    find('.show-user-profile a').click
    find(".sidebar .rep-points").should have_content '1'
  end
end

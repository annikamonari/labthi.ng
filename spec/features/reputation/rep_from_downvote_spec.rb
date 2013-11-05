require 'spec_helper'

feature 'Visitor gets reputation from' do
  before(:each) do
  	sign_in
  end

  scenario 'downvoting an idea' do
  	@idea = FactoryGirl.create(:idea)
    visit idea_path @idea
    click_link "vote-down-idea-#{@idea.id}"
    find('.show-user-profile a').click
    find(".rep-points").should have_content '-10'
  end
  scenario 'downvoting a question' do
    @question = FactoryGirl.create(:question)
    visit idea_path @question.idea
    click_link "vote-down-question-#{@question.id}"
    find('.show-user-profile a').click
    find(".rep-points").should have_content '-3'
  end
  scenario 'downvoting an answer' do
    @answer = FactoryGirl.create(:answer)
    visit question_path @answer.question
    click_link "vote-down-answer-#{@answer.id}"
    find('.show-user-profile a').click
    find(".rep-points").should have_content '-5'
  end
  scenario 'downvoting a solution' do
    @solution = FactoryGirl.create(:solution)
    visit idea_aspect_path @solution.idea, @solution.aspect
    click_link "vote-down-solution-#{@solution.id}"
    find('.show-user-profile a').click
    find(".rep-points").should have_content '-5'
  end
end

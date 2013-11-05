require 'spec_helper'

feature 'Visitor gets reputation from' do
  before(:each) do
    sign_in
  end

  scenario 'an idea upvoted' do
  	@idea = FactoryGirl.create(:idea)
    visit idea_path @idea
    click_link "vote-up-idea-#{@idea.id}"
    visit profile_path @idea.user
    find(".rep-points").should have_content '10'
  end
  scenario 'a question upvoted' do
    @question = FactoryGirl.create(:question)
    visit idea_path @question.idea
    click_link "vote-up-question-#{@question.id}"
    visit profile_path @question.user
    find(".rep-points").should have_content '5'
  end
  scenario 'an answer upvoted' do
    @answer = FactoryGirl.create(:answer)
    visit question_path @answer.question
    click_link "vote-up-answer-#{@answer.id}"
    visit profile_path @answer.user
    find(".rep-points").should have_content '10'
  end
  scenario 'a solution upvoted' do
    @solution = FactoryGirl.create(:solution)
    visit idea_aspect_path @solution.idea, @solution.aspect
    click_link "vote-up-solution-#{@solution.id}"
    visit profile_path @solution.user
    find(".rep-points").should have_content '10'
  end
  scenario 'a comment upvoted' do
    @comment = FactoryGirl.create(:comment)
    visit question_path @comment.commentable.question
    click_link "vote-up-comment-#{@comment.id}"
    visit profile_path @comment.user
    find(".rep-points").should have_content '1'
  end
end

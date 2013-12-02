require 'spec_helper'

feature 'Creator gets reputation from' do
  before(:each) do
  	sign_in
  end

  scenario 'switching an idea vote' do
  	@idea = FactoryGirl.create(:idea)
    visit idea_path @idea
    click_link "vote-down-idea-#{@idea.id}"
    click_link "vote-up-idea-#{@idea.id}"
    visit profile_path @idea.user
    find(".sidebar .rep-points").should have_content '20'
  end
  scenario 'switching a question vote' do
    @question = FactoryGirl.create(:question)
    visit idea_path @question.idea
    click_link "vote-down-question-#{@question.id}"
    click_link "vote-up-question-#{@question.id}"
    visit profile_path @question.user
    find(".sidebar .rep-points").should have_content '10'
  end
  scenario 'switching an answer vote' do
    @answer = FactoryGirl.create(:answer)
    visit question_path @answer.question
    click_link "vote-down-answer-#{@answer.id}"
    click_link "vote-up-answer-#{@answer.id}"
    visit profile_path @answer.user
    find(".sidebar .rep-points").should have_content '20'
  end
  scenario 'switching a solution vote' do
    @solution = FactoryGirl.create(:solution)
    visit idea_aspect_path @solution.idea, @solution.aspect
    click_link "vote-down-solution-#{@solution.id}"
    click_link "vote-up-solution-#{@solution.id}"
    visit profile_path @solution.user
    find(".sidebar .rep-points").should have_content '20'
  end
  scenario 'switching a comment vote' do
    @comment = FactoryGirl.create(:comment)
    visit question_path @comment.commentable.question
    click_link "vote-down-comment-#{@comment.id}"
    click_link "vote-up-comment-#{@comment.id}"
    visit profile_path @comment.user
    find(".sidebar .rep-points").should have_content '2'
  end
end
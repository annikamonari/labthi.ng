require 'spec_helper'

feature 'Creator gets reputation from' do
  before(:each) do
    sign_in
  end

  scenario 'an idea upvoted' do
  	@idea = FactoryGirl.create(:idea)
    visit idea_path @idea
    click_link "vote-up-idea-#{@idea.id}"
    visit profile_path @idea.user
    find(".badge-rep").should have_content '20'
  end
  scenario 'a question upvoted' do
    @question = FactoryGirl.create(:question)
    visit idea_path @question.idea
    click_link "vote-up-question-#{@question.id}"
    visit profile_path @question.user
    find(".badge-rep").should have_content '10'
  end
  scenario 'an answer upvoted' do
    @answer = FactoryGirl.create(:answer)
    visit question_path @answer.question
    click_link "vote-up-answer-#{@answer.id}"
    visit profile_path @answer.user
    find(".badge-rep").should have_content '20'
  end
  scenario 'a solution upvoted' do
    @solution = FactoryGirl.create(:solution)
    visit idea_aspect_path @solution.idea, @solution.aspect
    click_link "vote-up-solution-#{@solution.id}"
    visit profile_path @solution.user
    find(".badge-rep").should have_content '20'
  end
  scenario 'a comment upvoted' do
    @comment = FactoryGirl.create(:comment)
    visit question_path @comment.commentable.question
    click_link "vote-up-comment-#{@comment.id}"
    visit profile_path @comment.user
    find(".badge-rep").should have_content '2'
  end
  scenario 'a comment upvoted after downvoting it' do
    @comment = FactoryGirl.create(:comment)
    visit question_path @comment.commentable.question
    click_link "vote-down-comment-#{@comment.id}"
    click_link "vote-up-comment-#{@comment.id}"
    visit profile_path @comment.user
    find(".badge-rep").should have_content '2'
    find('.show-user-profile a').click
    find(".badge-rep").should have_content '0'
  end
end

require 'rails_helper'

feature 'Visitor loses reputation from' do
  before(:each) do
    #sign_in
    submit_idea
  end

  # The test user gets an initial 10 points from submitting
  # an idea, and then we expect some of these points to be
  # removed upon the relevant downvote

  scenario 'downvoting an idea' do
  	@idea = FactoryGirl.create(:idea)
    visit idea_path @idea
    click_link "vote-down-idea-#{@idea.id}"
    find('.show-user-profile a').click
    find(".badge-rep").should have_content '3'
  end
  scenario 'downvoting a question' do
    @question = FactoryGirl.create(:question)
    visit idea_path @question.idea
    click_link "vote-down-question-#{@question.id}"
    find('.show-user-profile a').click
    find(".badge-rep").should have_content '4'
  end
  scenario 'downvoting an answer' do
    @answer = FactoryGirl.create(:answer)
    visit question_path @answer.question
    click_link "vote-down-answer-#{@answer.id}"
    find('.show-user-profile a').click
    find(".badge-rep").should have_content '4'
  end
  scenario 'downvoting a solution' do
    @solution = FactoryGirl.create(:solution)
    visit idea_aspect_path @solution.idea, @solution.aspect
    click_link "vote-down-solution-#{@solution.id}"
    find('.show-user-profile a').click
    find(".badge-rep").should have_content '4'
  end
  scenario 'downvoting a comment' do
    @comment = FactoryGirl.create(:comment)
    visit question_path @comment.commentable.question
    click_link "vote-down-comment-#{@comment.id}"
    find('.show-user-profile a').click
    find(".badge-rep").should have_content '5'
  end
  scenario 'downvoting a comment after upvoting' do
    @comment = FactoryGirl.create(:comment)
    visit question_path @comment.commentable.question
    click_link "vote-up-comment-#{@comment.id}"
    click_link "vote-down-comment-#{@comment.id}"
    find('.show-user-profile a').click
    find(".badge-rep").should have_content '5'
    visit profile_path @comment.user
    find(".badge-rep").should have_content '0'
  end
end

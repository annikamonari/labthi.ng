require 'rails_helper'

feature 'Visitor gets reputation from' do
  before(:each) do
  	sign_in
  end

  scenario 'undoing an idea vote' do
  	@idea = FactoryGirl.create(:idea)
    visit idea_path @idea
    click_link "vote-down-idea-#{@idea.id}"
    click_link "vote-undo-idea-#{@idea.id}"
    find('.show-user-profile a').click
    find(".badge-rep").should have_content '0'
  end
  scenario 'undoing a question vote' do
    @question = FactoryGirl.create(:question)
    visit idea_path @question.idea
    click_link "vote-down-question-#{@question.id}"
    click_link "vote-undo-question-#{@question.id}"
    find('.show-user-profile a').click
    find(".badge-rep").should have_content '0'
  end
  scenario 'undoing an answer vote' do
    @answer = FactoryGirl.create(:answer)
    visit question_path @answer.question
    click_link "vote-down-answer-#{@answer.id}"
    click_link "vote-undo-answer-#{@answer.id}"
    find('.show-user-profile a').click
    find(".badge-rep").should have_content '0'
  end
  scenario 'undoing a solution vote' do
    @solution = FactoryGirl.create(:solution)
    visit idea_aspect_path @solution.idea, @solution.aspect
    click_link "vote-down-solution-#{@solution.id}"
    click_link "vote-undo-solution-#{@solution.id}"
    find('.show-user-profile a').click
    find(".badge-rep").should have_content '0'
  end
  scenario 'undoing a comment vote' do
    @comment = FactoryGirl.create(:comment)
    visit question_path @comment.commentable.question
    click_link "vote-down-comment-#{@comment.id}"
    click_link "vote-undo-comment-#{@comment.id}"
    find('.show-user-profile a').click
    find(".badge-rep").should have_content '0'
  end
end
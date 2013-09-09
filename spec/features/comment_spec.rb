require 'spec_helper'

feature 'Visitor submits a comment' do
    before(:each) do
        @idea_brief = 'Social network based on premise of only disliking posts'
        @question_title ='Target demographic'
        @question_brief = 'This social network should target a speific audience'
        @solution_brief = 'This product could target upper middle class males in NYC'
        @comment_brief = 'That is kind of a silly idea. NYC is too important.'

        submit_idea @idea_brief
        submit_question @question_title, @question_brief
    end

  scenario 'on a solution' do
        submit_solution @solution_brief
        submit_comment @comment_brief, '.solutions li:first-child'
        expect(page).to have_content(@idea_brief)
        expect(page).to have_content(@question_brief)
        expect(page).to have_content(@solution_brief)
        expect(page).to have_content(@comment_brief)
  end

  scenario 'on a question' do
        submit_comment @comment_brief, '.question'
        expect(page).to have_content(@question_brief)
        expect(page).to have_content(@comment_brief)
  end

  scenario 'on a comment' do
        @comment_reply = "That was a great comment!"
        submit_comment @comment_brief, '.question'
        submit_comment @comment_reply, '.comment', 'Reply to comment'
        expect(page).to have_content(@question_brief)
        expect(page).to have_content(@comment_reply)
  end
  scenario "and clicks its idea's tabs" do
    @idea = FactoryGirl.create(:idea, id: 800)
    visit url_for(@idea)
    question = 'Why should this product be manufactured?'
    brief = 'Lorem ipsum dolor sit amet!!!'
    submit_question question, brief
    visit url_for(@idea)
    click_link(question)
    click_link "Direct"
    page.should have_content
  end
end
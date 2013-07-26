require 'spec_helper'

feature 'Visitor submits a comment' do
    before(:each) do
        @idea_brief = 'Social network based on premise of only disliking posts'
        @industry = 'Social Media'
        @aspect_title ='Target demographic'
        @aspect_brief = 'This social network should target a speific audience'
        @solution_brief = 'This product could target upper middle class males in NYC'
        @comment_brief = 'That is kind of a silly idea. NYC is too important.'
    end

  scenario 'with valid params' do
        submit_idea @idea_brief, @industry
        update_idea
        submit_aspect @aspect_title, @aspect_brief
        submit_solution @solution_brief
        submit_comment @comment_brief
        expect(page).to have_content(@idea_brief)
        expect(page).to have_content(@aspect_brief)
        expect(page).to have_content(@solution_brief)
        expect(page).to have_content(@comment_brief)
  end

end
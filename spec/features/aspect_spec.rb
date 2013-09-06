require 'spec_helper'

=begin
feature 'Visitor submits an aspect' do
    before(:each) do
        @idea_brief = 'Social network based on premise of only disliking posts'
        @aspect_title ='Target demographic'
        @aspect_brief = 'This social network should target a speific audience'
    end

  scenario 'with valid params' do
        submit_idea @idea_brief
        update_idea
        submit_aspect @aspect_title, @aspect_brief
        expect(page).to have_content(@idea_brief)
        expect(page).to have_content(@aspect_brief)
  end

  scenario 'with invalid params' do
        submit_idea @idea_brief
        update_idea
        submit_aspect @aspect_title, ""
        expect(page).to have_no_content(@idea_brief)
        expect(page).to have_no_content(@aspect_brief)
  end
end
=end
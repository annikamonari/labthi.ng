require 'spec_helper'

feature 'Visitor updates an idea' do
    before(:each) do
        @idea_brief = 'Social network based on premise of only disliking posts'
        @industry = 'Social Media'
        @aspect_title ='Target demographic'
        @aspect_brief = 'This social network should target a speific audience'
    end

  scenario 'with valid params' do
        submit_idea
        update_idea
        visit 'activities/index'
        expect(page).to have_content('updated an idea valid brief')
  end

end
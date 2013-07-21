require 'spec_helper'

feature 'Visitor submits an aspect' do
    before(:each) do
        @user = FactoryGirl.create(:user)
        @idea = FactoryGirl.create(
            :idea,
            :user => @user
        )
        @aspect = FactoryGirl.build(
            :aspect,
            :idea => @idea,
            :user => @user
            )
        @idea_brief = 'Social network based on premise of only disliking posts'
        @industry = 'Social Media'
        @aspect_title ='Target demographic'
        @aspect_brief = 'This social network should target a speific audience'
    end

  scenario 'with valid params' do
        submit_idea @idea_brief, @industry
        update_idea
        submit_aspect @aspect_title, @aspect_brief
  end

end
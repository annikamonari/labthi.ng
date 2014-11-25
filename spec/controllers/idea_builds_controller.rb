require 'rails_helper'

describe IdeaBuildsController do

  before(:each) do
    @idea_build = create(:idea_build)
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET 'overview'" do
    it "returns http success" do
      get :overview, idea_id: @idea_build.idea.id
      response.should render_template :overview
    end
  end

end

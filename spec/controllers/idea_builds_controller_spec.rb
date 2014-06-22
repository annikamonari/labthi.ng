require 'spec_helper'

describe IdeaBuildsController do

  before(:each) do
    @idea_build = create(:idea_build)
  end

  describe "GET 'overview'" do
    it "returns http success" do
      get :overview, id: @idea_build.idea.id
      response.should render_template :overview
    end
  end

  describe "GET 'components'" do
    it "returns http success" do
      get :components, id: @idea_build.idea.id
      response.should render_template :components
    end
  end

end

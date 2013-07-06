require "spec_helper"

describe IdeaTagsController do
  describe "routing" do

    it "routes to #index" do
      get("/idea_tags").should route_to("idea_tags#index")
    end

    it "routes to #new" do
      get("/idea_tags/new").should route_to("idea_tags#new")
    end

    it "routes to #show" do
      get("/idea_tags/1").should route_to("idea_tags#show", :id => "1")
    end

    it "routes to #edit" do
      get("/idea_tags/1/edit").should route_to("idea_tags#edit", :id => "1")
    end

    it "routes to #create" do
      post("/idea_tags").should route_to("idea_tags#create")
    end

    it "routes to #update" do
      put("/idea_tags/1").should route_to("idea_tags#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/idea_tags/1").should route_to("idea_tags#destroy", :id => "1")
    end

  end
end

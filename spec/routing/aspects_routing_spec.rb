require "spec_helper"

describe AspectsController do
  describe "routing" do

    it "routes to #index" do
      get("/aspects").should route_to("aspects#index")
    end

    it "routes to #new" do
      get("/aspects/new").should route_to("aspects#new")
    end

    it "routes to #show" do
      get("/aspects/1").should route_to("aspects#show", :id => "1")
    end

    it "routes to #edit" do
      get("/aspects/1/edit").should route_to("aspects#edit", :id => "1")
    end

    it "routes to #create" do
      post("/aspects").should route_to("aspects#create")
    end

    it "routes to #update" do
      put("/aspects/1").should route_to("aspects#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/aspects/1").should route_to("aspects#destroy", :id => "1")
    end

  end
end

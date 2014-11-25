require "rails_helper"

describe AspectsController do
  describe "routing" do

    it "routes to #show" do
      get("/aspects/1").should route_to("aspects#show", :id => "1")
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

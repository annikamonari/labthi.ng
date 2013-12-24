require 'spec_helper'

describe ExploreController do

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end
  describe "GET 'build'" do
    it "returns http success" do
      get 'build'
      response.should be_success
    end
  end
  describe "GET 'buy'" do
    it "returns http success" do
      get 'buy'
      response.should be_success
    end
  end
end
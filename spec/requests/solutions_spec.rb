require 'spec_helper'

describe "Solutions" do
  describe "GET /solutions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get solutions_path
      response.status.should be(302)
    end
  end
end

require 'rails_helper'

RSpec.describe "TeamApplications", :type => :request do
  describe "GET /team_applications" do
    it "works! (now write some real specs)" do
      get team_applications_path
      expect(response).to have_http_status(200)
    end
  end
end

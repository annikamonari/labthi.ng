require 'rails_helper'

describe PartsController do

  before(:each) do
    @user = create(:user)
    sign_in @user
  end

  describe "GET 'edit'" do
    before(:each) do
      @part = create(:part)
      @idea = @part.idea
      sign_in create(:user, admin: true)
    end

    it "returns http success" do
      get :edit, id: @part, idea_id: @part.idea
      response.should render_template :edit
    end
  end

end

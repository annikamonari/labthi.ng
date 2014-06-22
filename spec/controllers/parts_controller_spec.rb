require 'spec_helper'

describe PartsController do

  before(:each) do
    @user = create(:user)
    sign_in @user
  end

  describe "GET 'edit'" do
    before(:each) do
      @part = create(:part)
      @idea = @part.idea
    end

    it "returns http success" do
      get :edit, id: @part, idea_id: @part.idea
      response.should render_template :edit
    end
  end

  describe "DELETE 'clear'" do
    it "returns http success" do
      part = create(:part, value: "valid value")
      delete :clear, id: part, idea_id: part.idea

      part.reload

      expect(part.value).to be nil
      expect(part.user).to be nil
    end
  end

  describe "PUT 'update'" do
    before(:each) do
      @part = create(:part)
      @idea = @part.idea
    end

    it "locates the requested part" do
      put :update, idea_id: @idea, id: @part, part: attributes_for(:part)
      assigns(:part).should eq(@part)
    end

    it "changes @part's attributes" do
      put :update, idea_id: @idea, id: @part, part: {value: "lorem ipsum dolor"}

      @part.reload
      
      expect(@part.value).to eq("lorem ipsum dolor")
    end
  end

end

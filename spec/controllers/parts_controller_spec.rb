require 'spec_helper'

describe PartsController do

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

end

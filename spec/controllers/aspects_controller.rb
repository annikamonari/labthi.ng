require 'rails_helper'

describe AspectsController do

  # This should return the minimal set of attributes required to create a valid
  # Aspect. As you add validations to Aspect, be sure to
  # adjust the attributes here as well.

    let(:valid_attributes){
      @idea = FactoryGirl.create(:idea)
      {
      title: "my title",
      brief: "this is a valid brief"
    } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AspectsController. Be sure to keep this updated too.
  let(:valid_session) { {  } }

  before(:each) {
    @user = FactoryGirl.create(:user)
    sign_in @user
  }

  describe "GET show" do
    it "assigns the requested aspect as @aspect" do
      aspect = Aspect.create! valid_attributes
      get :show, {idea_id: @idea.id, :id => aspect.to_param}
      assigns(:aspect).should eq(aspect)
    end
  end
end

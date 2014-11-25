require 'rails_helper'

describe IdeasController do

  # This should return the minimal set of attributes required to create a valid
  # Idea. As you add validations to Idea, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes){ { 
      title: "This is a title",
      brief: "This is a brief",
      phase: 1,
      active: true,
      category_list: ["Science & Technology"],
      component_list: ["Website"],
      user: @user
    }}

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # IdeasController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before(:each) {
    @user = FactoryGirl.create(:user)
    sign_in @user
  }

  describe "GET index" do
    it "assigns all ideas as @ideas" do
      idea = Idea.create! valid_attributes
      get :index, {}, valid_session
      assigns(:ideas).should eq([idea])
    end
  end

  describe "GET show" do
    it "assigns the requested idea as @idea" do
      idea = Idea.create! valid_attributes
      get :show, {:id => idea.to_param}, valid_session
      assigns(:idea).should eq(idea)
    end
  end

  describe "GET new" do
    it "assigns a new idea as @idea" do
      get :new, {}, valid_session
      assigns(:idea).should be_a_new(Idea)
    end
  end

  describe "GET edit" do
    it "assigns the requested idea as @idea" do
      idea = Idea.create! valid_attributes
      get :edit, {:id => idea.to_param}, valid_session
      assigns(:idea).should eq(idea)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Idea" do
        expect {
          post :create, {:idea => valid_attributes}, valid_session
        }.to change(Idea, :count).by(1)
      end

      it "assigns a newly created idea as @idea" do
        post :create, {:idea => valid_attributes}, valid_session
        assigns(:idea).should be_a(Idea)
        assigns(:idea).should be_persisted
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved idea as @idea" do
        # Trigger the behavior that occurs when invalid params are submitted
        Idea.any_instance.stub(:save).and_return(false)
        post :create, {:idea => { "phase" => "invalid value" }}, valid_session
        assigns(:idea).should be_a_new(Idea)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Idea.any_instance.stub(:save).and_return(false)
        post :create, {:idea => { "phase" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested idea" do
        idea = Idea.create! valid_attributes
        # Assuming there are no other ideas in the database, this
        # specifies that the Idea created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Idea.any_instance.should_receive(:update).with({ "phase" => "1" })
        put :update, {:id => idea.to_param, :idea => { "phase" => "1" }}, valid_session
      end

      it "assigns the requested idea as @idea" do
        idea = Idea.create! valid_attributes
        put :update, {:id => idea.to_param, :idea => valid_attributes}, valid_session
        assigns(:idea).should eq(idea)
      end

      it "redirects to the idea" do
        idea = Idea.create! valid_attributes
        put :update, {:id => idea.to_param, :idea => valid_attributes}, valid_session
        response.should redirect_to(idea)
      end
    end

    describe "with invalid params" do
      it "assigns the idea as @idea" do
        idea = Idea.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Idea.any_instance.stub(:save).and_return(false)
        put :update, {:id => idea.to_param, :idea => { "phase" => "invalid value" }}, valid_session
        assigns(:idea).should eq(idea)
      end

      it "re-renders the 'edit' template" do
        idea = Idea.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Idea.any_instance.stub(:save).and_return(false)
        put :update, {:id => idea.to_param, :idea => { "phase" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested idea" do
      idea = Idea.create! valid_attributes
      expect {
        delete :destroy, {:id => idea.to_param}, valid_session
      }.to change(Idea, :count).by(-1)
    end

    it "redirects to the ideas list" do
      idea = Idea.create! valid_attributes
      delete :destroy, {:id => idea.to_param}, valid_session
      response.should redirect_to(ideas_url)
    end
  end
end

require 'spec_helper'

describe AspectsController do

  # This should return the minimal set of attributes required to create a valid
  # Aspect. As you add validations to Aspect, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {
      "brief" => "MyText",
      "user" => FactoryGirl.create(:user),
      "idea" => FactoryGirl.create(:idea)
  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AspectsController. Be sure to keep this updated too.
  let(:valid_session) { { } }

  describe "GET index" do
    it "assigns all aspects as @aspects" do
      aspect = Aspect.create! valid_attributes
      get :index, {}, valid_session
      assigns(:aspects).should eq([aspect])
    end
  end

  describe "GET show" do
    it "assigns the requested aspect as @aspect" do
      aspect = Aspect.create! valid_attributes
      get :show, {:id => aspect.to_param}, valid_session
      assigns(:aspect).should eq(aspect)
    end
  end

  describe "GET new" do
    it "assigns a new aspect as @aspect" do
      get :new, {}, valid_session
      assigns(:aspect).should be_a_new(Aspect)
    end
  end

  describe "GET edit" do
    it "assigns the requested aspect as @aspect" do
      aspect = Aspect.create! valid_attributes
      get :edit, {:id => aspect.to_param}, valid_session
      assigns(:aspect).should eq(aspect)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Aspect" do

        expect {
          post :create, :aspect => valid_attributes
        }.to change{Aspect.count}.by(1)
      end

      it "assigns a newly created aspect as @aspect" do
        post :create, :aspect => valid_attributes
        assigns(:aspect).should be_a(Aspect)
        assigns(:aspect).should be_persisted
      end

      it "redirects to the created aspect" do
        post :create, :aspect => valid_attributes
        response.should redirect_to(Aspect.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved aspect as @aspect" do
        # Trigger the behavior that occurs when invalid params are submitted
        Aspect.any_instance.stub(:save).and_return(false)
        post :create, {:aspect => { "brief" => "invalid value" }}, valid_session
        assigns(:aspect).should be_a_new(Aspect)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Aspect.any_instance.stub(:save).and_return(false)
        post :create, {:aspect => { "brief" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested aspect" do
        aspect = Aspect.create! valid_attributes
        # Assuming there are no other aspects in the database, this
        # specifies that the Aspect created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Aspect.any_instance.should_receive(:update).with({ "brief" => "MyText" })
        put :update, {:id => aspect.to_param, :aspect => { "brief" => "MyText" }}, valid_session
      end

      it "assigns the requested aspect as @aspect" do
        aspect = Aspect.create! valid_attributes
        put :update, {:id => aspect.to_param, :aspect => valid_attributes}, valid_session
        assigns(:aspect).should eq(aspect)
      end

      it "redirects to the aspect" do
        aspect = Aspect.create! valid_attributes
        put :update, {:id => aspect.to_param, :aspect => valid_attributes}, valid_session
        response.should redirect_to(aspect)
      end
    end

    describe "with invalid params" do
      it "assigns the aspect as @aspect" do
        aspect = Aspect.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Aspect.any_instance.stub(:save).and_return(false)
        put :update, {:id => aspect.to_param, :aspect => { "brief" => "invalid value" }}, valid_session
        assigns(:aspect).should eq(aspect)
      end

      it "re-renders the 'edit' template" do
        aspect = Aspect.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Aspect.any_instance.stub(:save).and_return(false)
        put :update, {:id => aspect.to_param, :aspect => { "brief" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested aspect" do
      aspect = Aspect.create! valid_attributes
      expect {
        delete :destroy, {:id => aspect.to_param}, valid_session
      }.to change(Aspect, :count).by(-1)
    end

    it "redirects to the aspects list" do
      aspect = Aspect.create! valid_attributes
      delete :destroy, {:id => aspect.to_param}, valid_session
      response.should redirect_to(aspects_url)
    end
  end

end

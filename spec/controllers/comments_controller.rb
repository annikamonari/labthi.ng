require 'rails_helper'

describe CommentsController do

  # This should return the minimal set of attributes required to create a valid
  # Comment. As you add validations to Comment, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes){
    @comment = FactoryGirl.build(:comment)
    {
    brief: @comment.brief,
    user_id: @comment.user.id,
    commentable_id: @comment.commentable.id,
    commentable_type: @comment.commentable.class.to_s
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CommentsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before(:each) {
    @user = User.find(valid_attributes[:user_id])
    sign_in @user
  }

  describe "GET show" do
    it "assigns the requested comment as @comment" do
      comment = Comment.create! valid_attributes
      get :show, {:id => comment.to_param}, valid_session
      assigns(:comment).should eq(comment)
    end
  end

  describe "GET new" do
    it "assigns a new comment as @comment" do
      get :new, {:answer_id => valid_attributes[:commentable_id]}, valid_session
      assigns(:comment).should be_a_new(Comment)
    end
  end

  describe "GET edit" do
    it "assigns the requested comment as @comment" do
      comment = Comment.create! valid_attributes
      get :edit, {:id => comment.to_param}, valid_session
      assigns(:comment).should eq(comment)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, :comment => valid_attributes, :answer_id => valid_attributes[:commentable_id]
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, :comment => valid_attributes, :answer_id => valid_attributes[:commentable_id]
        assigns(:comment).should be_a(Comment)
        assigns(:comment).should be_persisted
      end

      it "redirects to the comment's question" do
        post :create, :comment => valid_attributes, :answer_id => valid_attributes[:commentable_id]
        response.should redirect_to(Comment.last.commentable.question)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved comment as @comment" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        post :create, {:comment => { "brief" => "invalid value" }, :answer_id => valid_attributes[:commentable_id]}, valid_session
        assigns(:comment).should be_a_new(Comment)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        post :create, {:comment => { "brief" => "invalid value" }, :answer_id => valid_attributes[:commentable_id]}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested comment" do
        comment = Comment.create! valid_attributes
        # Assuming there are no other comments in the database, this
        # specifies that the Comment created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Comment.any_instance.should_receive(:update).with({ "brief" => "MyText" })
        put :update, {:id => comment.to_param, :comment => { "brief" => "MyText" }}, valid_session
      end

      it "assigns the requested comment as @comment" do
        comment = Comment.create! valid_attributes
        put :update, {:id => comment.to_param, :comment => valid_attributes}, valid_session
        assigns(:comment).should eq(comment)
      end

      it "redirects to the comment's question" do
        comment = Comment.create! valid_attributes
        put :update, {:id => comment.to_param, :comment => valid_attributes}, valid_session
        response.should redirect_to(comment.commentable.question)
      end
    end

    describe "with invalid params" do
      it "assigns the comment as @comment" do
        comment = Comment.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        put :update, {:id => comment.to_param, :comment => { "brief" => "invalid value" }}, valid_session
        assigns(:comment).should eq(comment)
      end

      it "re-renders the 'edit' template" do
        comment = Comment.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Comment.any_instance.stub(:save).and_return(false)
        put :update, {:id => comment.to_param, :comment => { "brief" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested comment" do
      comment = Comment.create! valid_attributes
      expect {
        delete :destroy, {:id => comment.to_param}, valid_session
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the comments list" do
      comment = Comment.create! valid_attributes
      delete :destroy, {:id => comment.to_param}, valid_session
      response.should redirect_to(comments_url)
    end
  end

end

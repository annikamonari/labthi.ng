class PostsController < ApplicationController
  before_action :set_idea
  before_action :set_idea_build
  before_action :summary_of_business, only: [:new]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.idea_build_id = @idea_build.id
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        @post.create_activity :create, owner: (current_user)
        format.html { redirect_to idea_build_feed_path(@idea), notice: 'Post was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def destroy
    @post.destroy
    redirect_to idea_build_feed_path(@idea)
  end

  private

    def set_idea
      @idea = Idea.find(params[:idea_id])
    end

    def set_idea_build
      @idea_build = @idea.idea_build
    end

    def post_params
      params.require(:post).permit(:title, :kind, :content, :image, :status)
    end
end


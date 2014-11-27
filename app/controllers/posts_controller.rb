class PostsController < ApplicationController
  before_action :set_idea
  before_action :set_idea_build
  before_action :summary_of_business, only: [:new, :new_proposal]
  before_action :set_post_create, only: [:create, :create_proposal]
  before_action :new_post, only: [:new, :new_proposal]

  def new
  end

  def new_proposal
  end

  def create
    @post.kind = 'news'

    respond_to do |format|
      if @post.save
        #@post.create_activity :create, owner: (current_user)
        format.html { redirect_to idea_build_feed_path(@idea), notice: 'Post was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def create_proposal
    @post.kind = 'team'

    respond_to do |format|
      if @post.save
        #@post.create_activity :create, owner: (current_user)
        format.html { redirect_to idea_build_team_build_path(@idea), notice: 'Proposal was successfully created.' }
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

    def set_post_create
      @post = Post.new(post_params)
      @post.idea_build_id = @idea_build.id
      @post.user_id = current_user.id
    end

    def new_post
      @post = Post.new
    end

    def post_params
      params.require(:post).permit(:title, :kind, :content, :image, :status)
    end
end


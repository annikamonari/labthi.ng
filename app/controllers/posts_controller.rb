class PostsController < ApplicationController
  include ActionView::Helpers::DateHelper
  before_action :set_idea
  before_action :set_idea_build
  before_action :summary_of_business, only: [:new, :new_proposal]
  before_action :set_post_create, only: [:create, :create_proposal]
  before_action :set_post, only: [:close_proposal, :show]
  before_action :summary_of_business, only: [:show]

  def show
    @team_application = TeamApplication.new
    @applications = @post.team_applications
    @time = time_ago_in_words(@post.created_at)
  end

  def create
    if current_user.team_memberships.find_by(idea_build_id: @idea_build.id)
      @post.kind = 'news'
      @post.status = 'open'
      respond_to do |format|
        if @post.save
          #@post.create_activity :create, owner: (current_user)
          format.html { redirect_to idea_build_feed_path(@idea), notice: 'Post was successfully created.' }
        else
          format.html { render action: 'new' }
        end
      end
    else 
      redirect_to :back, notice: "You must be a team member to post on the news feed."
    end
  end

  def create_proposal
    if current_user.team_memberships.find_by(idea_build_id: @idea_build.id)
      @post.kind = 'team'
      @post.status = 'open'
      respond_to do |format|
        if @post.save
          #@post.create_activity :create, owner: (current_user)
          format.html { redirect_to idea_build_team_build_path(@idea), notice: 'Proposal was successfully created.' }
        else
          format.html { render action: 'new' }
        end
      end
    else 
      redirect_to :back, notice: "You must be a team member to write a proposal."
    end
  end

  def close_proposal
    if current_user.team_memberships.find_by(idea_build_id: @idea_build.id)
      @post.status = 'closed'
      if @post.save
        redirect_to idea_build_team_build_path, notice: 'You have succcessfully closed the post. It cannot be reopened.'
      else
        redirect_to idea_build_team_build_path, notice: 'There has been an error closing the post. Please try again.'
      end
    else 
      redirect_to :back, notice: "You do not have permission to close a proposal."
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

    def set_post
      @post = Post.find(params[:post_id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :image)
    end
end


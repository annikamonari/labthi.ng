class IdeaBuildsController < ApplicationController
  before_action :set_idea
  before_action :team_member, only: [:discussion, :overview, :components]
  before_action :set_idea_build
  before_action :summary_of_business, only: [:news_feed, :team_build]

  def overview
  end

  def components
  end

  def discussion
  end

  def news_feed
    @posts = get_posts('news')
    @post = Post.new
    @task_comment = TaskComment.new
  end 

  def team_build
    @posts = get_posts('team')
    @post = Post.new
    @task_comment = TaskComment.new
  end

  private 
    def set_idea
      @idea = Idea.find(params[:idea_id])
    end

    def set_idea_build
      @idea_build = @idea.idea_build
    end

    def get_posts(kind)
      @idea_build.posts.where(kind: kind)
    end

end

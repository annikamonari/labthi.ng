class IdeaBuildsController < ApplicationController
  before_action :set_idea
  before_action :set_idea_build
  before_action :auth_user!
  before_action :summary_of_business, only: [:news_feed, :team_build]

  def overview
  end

  def components
  end

  def discussion
  end

  def news_feed
    @posts = @idea_build.posts
  end 

  def team_build
  end

  private 
    def set_idea
      @idea = Idea.find(params[:idea_id])
    end

    def set_idea_build
      @idea_build = @idea.idea_build
    end

    #TODO: figure out how to remove the html from the @brief. Its ugly
end

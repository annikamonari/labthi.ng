class IdeaBuildsController < ApplicationController
  before_action :set_idea
  before_action :set_idea_build

  def overview
  end

  def components
  end

  def set_idea
    @idea = Idea.find(params[:idea_id])
  end

  def set_idea_build
    @idea_build = @idea.idea_build
    puts "-------------------------------"
    puts "DEBUG: #{@idea_build.to_s}"
  end
end

class ExploreController < ApplicationController
  before_action :set_categories
  
  layout 'sidebar_left_small'

  def create
    get_ideas(1)
  end
  def build
    get_ideas(2)
    @ideas = Idea.where(phase: 2).includes(:idea_build, :user)
  end
  def buy
    
  end

  private

  def set_categories
    @categories = Idea.categories
  end

  def get_ideas(phase)
    if params[:category]
      category = params[:category]
      @ideas = Idea.where(phase: phase).tagged_with(category, :on => :categories).includes(:idea_build, :user)
    else
      @ideas = Idea.where(phase: phase).includes(:idea_build, :user)
    end
  end
end

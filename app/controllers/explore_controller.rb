class ExploreController < ApplicationController
  before_action :get_ideas
  before_action :set_categories
  
  layout 'sidebar_left_small'

  def create
    
  end
  def build
    
  end
  def buy
    
  end

  private

  def set_categories
    @categories = Idea.categories
  end

  def get_ideas
    if params[:phase]
      @ideas = Idea.where(phase: params[:phase]).includes(:user)
    elsif params[:category]
      category = params[:category]
      @ideas = Idea.tagged_with(category, :on => :categories).includes(:user)
    else
      @ideas = Idea.all.includes(:user)
    end
  end
end

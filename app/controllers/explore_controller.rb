class ExploreController < ApplicationController
  before_action :get_ideas
  before_action :set_categories
  
  layout 'sidebar_left'

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
      @ideas = Idea.where(phase: params[:phase])
    elsif params[:category]
      category = params[:category]
      @ideas = Idea.tagged_with category, :on => :categories
    else
      @ideas = Idea.all
    end
  end
end

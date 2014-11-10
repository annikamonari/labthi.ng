class ExploreController < ApplicationController
  include ActionView::Helpers::DateHelper
  before_action :set_categories
  
  layout 'sidebar_left_small'

  def create
    get_ideas(1)
  end
  def build
    get_ideas(2)
  end
  def buy
    get_ideas(3)
  end

  private

  def set_categories
    @categories = Idea.categories
  end

  def get_ideas(phase)
    if params[:category]
      category = params[:category]
      @ideas = Idea.where(phase: phase).tagged_with(category, :on => :categories).includes(:user)
    else
      @ideas = Idea.where(phase: phase).includes(:user)
    end
  end
end

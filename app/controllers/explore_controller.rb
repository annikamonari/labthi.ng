class ExploreController < ApplicationController
  layout 'sidebar_left'
  def index
    get_ideas
    @categories = set_categories
  end

  private
  def print_idea

  end

  def brief_class
    this.downcase.gsub(/\s+/, '-').gsub(/[^a-z0-9_-]/, '').squeeze('-')
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

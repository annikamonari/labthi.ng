class CreateController < ApplicationController
  layout 'sidebar_left'
  def index
    get_ideas
    @categories = Idea.categories
  end

  private

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

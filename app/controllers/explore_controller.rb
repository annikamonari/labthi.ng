class ExploreController < ApplicationController
  include ActionView::Helpers::DateHelper
  before_action :set_categories
  
  layout 'create'

  def create
    unless ['sidd.fares@gmail.com', 'alan.vey@gmail.com', 'annikamonari@gmail.com'].include?(current_user.email) 
      sign_out current_user
      return redirect_to '/', notice: 'Please give us a moment to set up some nice ideas for you :)'
    end

    get_ideas(1)
  end

  def build
    get_ideas(2)
  end

  def buy
    get_ideas(3)
  end

  def needs_team
    get_ideas(2)
    @ideas = @ideas.includes(:idea_build => :posts).map do |idea| 
      if (idea.idea_build.posts.map { |post| post if (post.kind == 'team' and post.status == 'open') }).compact.length > 0
        idea
      end
    end
    @ideas = @ideas.compact
  end

  private

    def set_categories
      @categories = Idea.categories
    end

    def get_ideas(phase)
      if params[:category]
        category = params[:category]
        @ideas = Idea.where(phase: phase, category: category).includes(:user)
      else
        @ideas = Idea.where(phase: phase).includes(:user)
      end
    end
end






















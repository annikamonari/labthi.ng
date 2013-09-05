class ExploreController < ApplicationController
  def index
  	if params[:phase]
  		@ideas = Idea.where(phase: params[:phase])
  		#@idea = Idea.find_by phase: params[:phase]
		else
  		@ideas = Idea.all
		end
  end

  private
  def print_idea

  end

  def brief_class
    this.downcase.gsub(/\s+/, '-').gsub(/[^a-z0-9_-]/, '').squeeze('-')
  end

end

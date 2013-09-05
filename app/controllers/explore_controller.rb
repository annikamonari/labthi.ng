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
end

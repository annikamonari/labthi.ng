class ExploreController < ApplicationController
  def index
  	@ideas = Idea.all
  end
end

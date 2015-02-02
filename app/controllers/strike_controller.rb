class StrikeController < ApplicationController

  def create
    if Strike.create(params[:user_id], params[:idea_build_id], params[:voter_id])
      redirect_to :back, notice: 'You voted for a strike'
    else
      redirect_to :back, notice: 'You have already voted for a strike. You cannot vote twice'
    end
  end
  
end

class LikesController < ApplicationController
  def like
    like = Like.new
    
    like.model_name = params[:model_name]
    like.model_id   = params[:model_id]
    like.user_id    = params[:user_id]
    
    if like.save
      redirect_to :back, notice: 'Thanks for liking it!'
    else
      redirect_to :back, notice: 'You have already liked it'
    end
  end

end

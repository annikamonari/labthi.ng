class BuyPhaseVoteController < ApplicationController
  before_action :set_idea

  def buy_vote
    if create_vote(true)
      redirect_to :back, notice: 'Thanks for your vote to buy'
    else
      redirect_to :back, notice: 'An error occured with your vote... Sorry'
    end
  end

  def use_vote
    if create_vote(false)
      redirect_to :back, notice: 'Thanks for your vote to use'
    else
      redirect_to :back, notice: 'An error occured with your vote... Sorry'
    end
  end

  private
    def set_idea
      @idea = Idea.find(params[:id])
    end

    def create_vote(buy)
      @vote         = BuyPhaseVote.new
      @vote.user_id = current_user.id
      @vote.idea_id = @idea.id
      @vote.buy     = buy
      @vote.save
    end
end

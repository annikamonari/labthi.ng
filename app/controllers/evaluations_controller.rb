class EvaluationsController < ApplicationController
	before_action :set_voteable
	before_action :set_value

	def show
	end

  def vote
    @voteable.add_or_update_evaluation(:votes, @value, current_user) unless current_user == nil
    respond_to do |format|
      format.html {redirect_to :back, notice: "Vote submitted"}
      format.js {render template: 'evaluations/vote'}
    end
  end

private
  def set_voteable
  	case params[:voteable_class]
  		when "Idea"
  			@voteable = Idea.find(params[:voteable_id])
      when "Question"
        @voteable = Question.find(params[:voteable_id])
      when "Solution"
        @voteable = Solution.find(params[:voteable_id])
      when "Answer"
        @voteable = Answer.find(params[:voteable_id])
      when "Comment"
        @voteable = Comment.find(params[:voteable_id])
    end
  end

  def set_value
  	case params[:type]
      when "up"
        @value = 1
      when "down"
        @value = -1
      when "undo"
        @value = 0
    end
  end

end

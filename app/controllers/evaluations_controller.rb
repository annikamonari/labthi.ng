class EvaluationsController < ApplicationController
	before_action :set_voteable
	before_action :set_value

	def show
	end

  def vote
    @previous_votes = @voteable.reputation_for(:votes)
    @voteable.add_or_update_evaluation(:votes, @value, current_user) unless current_user == nil
    respond_to do |format|
      update_user_score
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

  def update_user_score
    update_user_score_from_downvote if @value == -1
    update_user_score_from_upvote if @value == 1
    update_user_score_from_undo if @value == 0
  end

  def update_user_score_from_upvote
    case @voteable.class.to_s
      when "Idea"
        @voteable.user.add_points(10, 'Idea upvoted')
      when "Question"
        @voteable.user.add_points(5, 'Question upvoted')
      when "Answer"
        @voteable.user.add_points(10, 'Answer upvoted')
      when "Solution"
        @voteable.user.add_points(10, 'Solution upvoted')
      when "Comment"
        @voteable.user.add_points(1, 'Comment upvoted')
    end
  end

  def update_user_score_from_downvote
    case @voteable.class.to_s
      when "Idea"
        current_user.subtract_points(10, 'Downvoted an idea')
      when "Question"
        current_user.subtract_points(3, 'Downvoted a question')
      when "Answer"
        current_user.subtract_points(5, 'Downvoted an answer')
      when "Solution"
        current_user.subtract_points(5, 'Downvoted a solution')
      when "Comment"
        current_user.subtract_points(1, 'Downvoted a comment')
    end
  end

  def update_user_score_from_undo
    if @voteable.reputation_for(:votes) - @previous_votes == -1
      update_user_score_from_upvote
    else
      update_user_score_from_downvote
    end
  end
end

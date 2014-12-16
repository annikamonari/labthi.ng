class CommentsController < ApplicationController
  before_action :load_commentable
  before_action :set_vote_value, only: [:vote]

  def create
    @commentable = eval(params[:commentable_type]).find(params[:commentable_id])
    @comment = @commentable.comments.new(comment_params)
    @comment.commentable_id = params[:commentable_id]
    @comment.commentable_type = params[:commentable_type]
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        @comment.create_activity :create, owner: (current_user)
        format.html { redirect_to get_redirect_path(@comment.commentable), notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to :back, notice: 'There has been an error creating your comment. Please try again.' }
      end
    end
  end

  def vote
    @voteable = Comment.find(params[:voteable_id])
    @voteable.update_lab_evaluation(@value, current_user) unless current_user == nil
    respond_to do |format|
      format.html {redirect_to :back, notice: "Vote submitted"}
      format.js {render template: 'evaluations/vote'}
    end
  end

  private
    def set_idea
      @idea = Idea.find(params[:idea_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def get_redirect_path(c)
      if c.class.name == 'Comment' then
        return @question_path = get_redirect_path(c.commentable)
      elsif c.class.name == 'Question' then
        return @question_path = c
      elsif c.class.name == 'Answer' then
        return @question_path = c.question
      elsif c.class.name == 'Aspect' then
        return @question_path = c
      elsif c.class.name == 'Solution' then
        return @question_path = idea_aspect_path(id: c.aspect.id, idea_id: c.idea.id)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:brief)
    end
end

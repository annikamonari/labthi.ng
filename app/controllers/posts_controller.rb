class PostsController < ApplicationController

  def show
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id]
    @answer.user = current_user

    respond_to do |format|
      if @answer.save
        @answer.create_activity :create, owner: (current_user)
        format.html { redirect_to @answer.question, notice: 'Answer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @answer }
        format.js {render template: 'answers/create'}
        if not current_user.following_idea?(@answer.question.idea)
          current_user.follow_idea!(@answer.question.idea)
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :kind, :content, :image, :status, :likes)
    end
end


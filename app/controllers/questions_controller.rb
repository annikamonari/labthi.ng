class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :auth_user!, except: [:show]
  before_action :set_vote_value, only: [:vote]
  before_action :correct_user, only: [:edit]

  # GET /questions/1
  # GET /questions/1.json
  def show
    @idea = @question.idea
    @answers = @question.answers.includes(:user)
    render layout: 'sidebar_left'
  end

  # GET /questions/new
  def new
    @question = Question.new
    render layout: 'form_left'
  end

  # GET /questions/1/edit
  def edit
    render layout: 'form_left'
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.idea_id = params[:idea_id]
    @question.user = current_user

    respond_to do |format|
      if @question.save
        @question.create_activity :create, owner: (current_user)
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question }
        if not current_user.following_idea?(@question.idea)
          current_user.follow_idea!(@question.idea)
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        @question.create_activity :update, owner: (current_user)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  def vote
    @voteable = Question.find(params[:voteable_id])
    @voteable.update_lab_evaluation(@value, current_user) unless current_user == nil
    respond_to do |format|
      format.html {redirect_to :back, notice: "Vote submitted"}
      format.js {render template: 'evaluations/vote'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :brief, :idea_id, :user_id)
    end

    def correct_user
      current_user = :auth_user!
      user = Question.find(params[:id]).user if params[:id]
      redirect_to @question, notice: "You do not have permission to edit this question." unless current_user == user
    end
end

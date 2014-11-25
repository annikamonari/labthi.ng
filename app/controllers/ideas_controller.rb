class IdeasController < ApplicationController
  before_action :set_idea, except: [:create, :new, :index, :vote]
  before_action :set_questions, only: [:show]
  before_action :auth_user!, only: [:new, :create, :edit, :update]
  before_action :set_tags, except: [:index, :vote]
  before_action :set_vote_value, only: [:vote]
  before_action :correct_user, only: [:edit]
  before_action :promote, except: [:create, :new, :index, :vote]

  # GET /ideas
  # GET /ideas.json
  def index
    redirect_to '/create'
    @ideas = Idea.all
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    render layout: 'sidebar_left'
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
    render layout: 'form_left'
  end

  def new_question
    @question = Question.new
    render layout: 'sidebar_left'
  end

  # GET /ideas/1/edit
  def edit
    render layout: 'form_left'
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)
    @idea.phase = 1
    @idea.active = 'true'
    @idea.user = current_user
    @idea.create_days = Date.today + params[:idea][:create_days].to_i.days
    respond_to do |format|
      if @idea.save
        @idea.create_activity :create, owner: (current_user)
        format.html { redirect_to @idea }
        format.json { render action: 'show', status: :created, location: @idea }
        current_user.follow_idea!(@idea)
      else
        format.html { render action: 'new' }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        @idea.create_activity :update, owner: (current_user)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url }
    end
  end

  def vote
    @voteable = Idea.find(params[:voteable_id])
    @voteable.update_lab_evaluation(@value, current_user) unless current_user == nil
    respond_to do |format|
      format.html {redirect_to :back, notice: "Vote submitted"}
      format.js {render template: 'evaluations/vote'}
    end
  end

  def increase_create_length
    if @idea.user == current_user
      if @idea.increase_create_days
        redirect_to @idea, notice: "You have increased the idea's create phase length by 1 day."
      else
        redirect_to :back, notice: "There has been an error processing your request. Please try again."
      end
    end
  end

  def define
    @aspects = Aspect.all
    render layout: 'sidebar_left'
  end

  def reputation
    @users_points = sum_points(@idea.get(:local_reputation))
    render layout: 'sidebar_left'
  end

  def activity
    @activities = @idea.get_idea_activities
    render layout: 'sidebar_left'
  end

  def followers
    @idea_followers = @idea.followers.includes(:profile)
    render layout: 'sidebar_left'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end
    def set_questions
      @questions = Question.where(idea_id: @idea.id)
    end
    def set_tags
      @categories = Idea.categories
      @components = Idea.components
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(
        :phase,
        :create_days,
        :title,
        :brief,
        :image,
        :active,
        :user_id,
        :type,
        :category_list => [],
        :component_list => [],
        :aspects_attributes => [:id, :brief, :title]
        )
    end
    def correct_user
      current_user = :auth_user!
      user = Idea.find(params[:id]).user if params[:id]
      redirect_to @idea, notice: "You do not have permission to edit this idea." unless current_user == user
    end

    def sum_points(users_points)
      sorted             = users_points.sort_by { |u| u[0] }
      points             = 0
      summed_users_points = Array.new

      (0..sorted.length - 1).each do |i|
        user    = sorted[i][0]
        points += sorted[i][1]

        if sorted[i + 1].nil? or sorted[i + 1][0] != user
          summed_users_points << [user, points]
          points = 0
        end
      end
      (summed_users_points.sort_by {|u| -u[1]})[0..4]  
    end

    def promote
      if (Date.today >= @idea.create_days) and @idea.phase == 1
        @idea.promote!
      end
    end
end

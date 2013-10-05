class IdeasController < ApplicationController
  before_action :set_idea, except: [:create, :new, :index]
  before_action :set_questions, only: [:show]
  before_action :auth_user!, only: [:new, :create, :edit, :update]
  before_action :set_tags, except: [:index]

  # GET /ideas
  # GET /ideas.json
  def index
    redirect_to '/explore'
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
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)
    @idea.phase = 1
    @idea.active = 'true'
    @idea.user = current_user
    respond_to do |format|
      if @idea.save
        @idea.create_activity :create, owner: (current_user)
        #Aspect.find_or_create_by(title: "Image")
        format.html { redirect_to @idea, notice: "Great! Now let's expand on that a little." }
        format.json { render action: 'show', status: :created, location: @idea }
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
      format.json { head :no_content }
    end
  end

  def define
    @aspects = Aspect.all
    render layout: 'sidebar_left'
  end

  def reputation
    render layout: 'sidebar_left'
  end

  def activity
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
      @categories = set_categories
      @components = set_components
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(
        :phase,
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
end

class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :set_aspects, only: [:show]
  before_action :auth_user!, only: [:update] #cutstom method below
  before_action :set_categories, only: [:edit, :update]

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @user = @idea.user
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
    respond_to do |format|
      if @idea.save
        @idea.create_activity :create, owner: (current_user || current_admin)
        format.html { redirect_to edit_idea_path(@idea), notice: "Great! Now let's expand on that a little." }
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
    @idea.user = current_user
    respond_to do |format|
      if @idea.update(idea_params)
        @idea.create_activity :update, owner: (current_user || current_admin)
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end
    def set_aspects
      @aspects = Aspect.where(idea_id: @idea)
    end
    def set_categories
      @categories = [
        "Arts & Entertainment",
        "Science & Technology",
        "Business & Finance",
        "Software & Internet",
        "Retail",
        "Education",
        "Energy & Utilities",
        "Food & Health",
        "Media & Communications",
        "Other"
      ]
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(
        :phase,
        :brief,
        :image,
        :active,
        :user_id,
        :category_list => [],
        :aspects_attributes => [:id, :brief, :title]
        )
    end
end

class AspectsController < ApplicationController
  before_action :set_aspect, only: [:show, :edit, :update, :destroy]
  before_action :set_idea, only: [:new]
  before_action :authenticate_user!

  # GET /aspects
  # GET /aspects.json
  def index
    @aspects = Aspect.all
  end

  # GET /aspects/1
  # GET /aspects/1.json
  def show
  end

  # GET /aspects/new
  def new
    @aspect = Aspect.new
  end

  # GET /aspects/1/edit
  def edit
  end

  # POST /aspects
  # POST /aspects.json
  def create
    @aspect = Aspect.new(aspect_params)
    @aspect.idea_id = params[:idea_id]
    @aspect.user = current_user
    unless @aspect.valid?
      if @aspect.user_id
        puts @aspect.user_id
      else
        puts "user_id is nil"
      end
    end
    respond_to do |format|
      if @aspect.save
        format.html { redirect_to @aspect, notice: 'Aspect was successfully created.' }
        format.json { render action: 'show', status: :created, location: @aspect }
      else
        format.html { render action: 'new' }
        format.json { render json: @aspect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aspects/1
  # PATCH/PUT /aspects/1.json
  def update
    respond_to do |format|
      if @aspect.update(aspect_params)
        format.html { redirect_to @aspect, notice: 'Aspect was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @aspect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aspects/1
  # DELETE /aspects/1.json
  def destroy
    @aspect.destroy
    respond_to do |format|
      format.html { redirect_to aspects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aspect
      @aspect = Aspect.find(params[:id])
    end
    def set_idea
      @idea = Idea.find(params[:idea_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aspect_params
      params.require(:aspect).permit(:brief, :title, :user_id, :idea_id)
    end
end

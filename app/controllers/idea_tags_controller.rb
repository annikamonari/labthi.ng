class IdeaTagsController < ApplicationController
  before_action :set_idea_tag, only: [:show, :edit, :update, :destroy]

  # GET /idea_tags
  # GET /idea_tags.json
  def index
    @idea_tags = IdeaTag.all
  end

  # GET /idea_tags/1
  # GET /idea_tags/1.json
  def show
  end

  # GET /idea_tags/new
  def new
    @idea_tag = IdeaTag.new
  end

  # GET /idea_tags/1/edit
  def edit
  end

  # POST /idea_tags
  # POST /idea_tags.json
  def create
    @idea_tag = IdeaTag.new(idea_tag_params)

    respond_to do |format|
      if @idea_tag.save
        format.html { redirect_to @idea_tag, notice: 'Idea tag was successfully created.' }
        format.json { render action: 'show', status: :created, location: @idea_tag }
      else
        format.html { render action: 'new' }
        format.json { render json: @idea_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /idea_tags/1
  # PATCH/PUT /idea_tags/1.json
  def update
    respond_to do |format|
      if @idea_tag.update(idea_tag_params)
        format.html { redirect_to @idea_tag, notice: 'Idea tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @idea_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /idea_tags/1
  # DELETE /idea_tags/1.json
  def destroy
    @idea_tag.destroy
    respond_to do |format|
      format.html { redirect_to idea_tags_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea_tag
      @idea_tag = IdeaTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_tag_params
      params.require(:idea_tag).permit(:name)
    end
end

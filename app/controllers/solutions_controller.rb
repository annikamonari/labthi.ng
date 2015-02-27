class SolutionsController < ApplicationController
  before_action :set_solution, only: [:show, :edit, :update, :destroy]
  before_action :set_vote_value, only: [:vote]


  # GET /solutions/1
  # GET /solutions/1.json
  def show
    redirect_to idea_aspect_path(@solution.idea, @solution.aspect)
  end

  # GET /solutions/new
  def new
    @solution = Solution.new
    render layout: "form_left"
  end

  # POST /solutions
  # POST /solutions.json
  def create
    @solution = Solution.new(solution_params)
    @solution.aspect = Aspect.find(params[:id])
    @solution.idea = Idea.find(params[:idea_id])
    @solution.user = current_user

    respond_to do |format|
      if @solution.save
        @solution.create_activity :create, owner: (current_user || current_admin)
        format.html { redirect_to redirect_path, notice: 'Solution was successfully created.' }
        if not current_user.following_idea?(@solution.idea)
          current_user.follow_idea!(@solution.idea)
        end
      else
        format.html { render action: 'new' }
      end
    end
  end

  # DELETE /solutions/1
  # DELETE /solutions/1.json
  def destroy
    @solution.destroy
    respond_to do |format|
      format.html { redirect_to solutions_url }
      format.json { head :no_content }
    end
  end

  def vote
    @voteable = Solution.find(params[:voteable_id])
    @voteable.update_lab_evaluation(@value, current_user) unless current_user == nil
    respond_to do |format|
      format.html {redirect_to :back, notice: "Vote submitted"}
      format.js {render template: 'evaluations/vote'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solution
      @solution = Solution.find(params[:id])
    end      

    def redirect_path
      idea_aspect_path(idea_id:@solution.idea.id, id: @solution.aspect.id)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def solution_params
      params.require(:solution).permit(:brief)
    end
end

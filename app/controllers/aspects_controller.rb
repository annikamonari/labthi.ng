class AspectsController < ApplicationController
  before_action :load_commentable, only: [:show]
  before_action :set_aspect, only: [:show]
  #before_action :authenticate_admin_user!, except: [:show]

  # GET /aspects/1
  # GET /aspects/1.json
  def show
    @solution = Solution.new
    @commentable = Solution.first
    @idea = Idea.find(params[:idea_id])
    @solutions = Solution.includes(:user, :aspect, :idea).where(idea_id: @idea.id, aspect_id:@aspect.id)
    @comment = @commentable.nil? ? Comment.new : @commentable.comments.new
    render layout: 'sidebar_left'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aspect
      @aspect = Aspect.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aspect_params
      params.require(:aspect).permit(:brief, :title)
    end
end

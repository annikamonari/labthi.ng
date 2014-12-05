class TeamApplicationsController < ApplicationController
  before_action :set_idea
  before_action :set_idea_build
  before_action :set_post

  def create
    @team_application = TeamApplication.new(team_application_params)
    @team_application.post = @post
    @team_application.user = current_user
    respond_to do |format|
      if @team_application.save
        format.html { redirect_to post_path(post_id: @post.id, idea_id: @idea.id), notice: 'Application was successfully created.' }
      else
        format.html { redirect_to idea_build_team_build_path(@idea), notice: 'There was a problem processing your request.' }
      end
    end
  end

  private

    def set_idea
      @idea = Idea.find(params[:idea_id])
    end

    def set_idea_build
      @idea_build = @idea.idea_build
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def team_application_params
      params.require(:team_application).permit(:pitch)
    end
end


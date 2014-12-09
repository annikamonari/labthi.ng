class TeamMembershipsController < ApplicationController

  def create
    @team_application = TeamApplication.find(params[:team_application_id])
    @idea_build       = IdeaBuild.find(params[:idea_build_id])
    
    if current_user.team_memberships.find_by(idea_build_id: @idea_build.id) and Vote.find_by(user_id: current_user.id, kind_id: @team_application.id, kind: 'TeamApplication').nil?
      Vote.create(current_user.id, @team_application)
      if enough_votes?(@team_application.id, @idea_build.id)
        if TeamMembership.create(@team_application.user.id, @idea_build.id)
          redirect_to :back, notice: 'The user has been accepted as a team member.'
        else
          redirect_to :back, notice: 'There has been an error saving the team member.'
        end
      else
        redirect_to :back, notice: "Your vote has been saved."
      end
    else
      redirect_to :back, notice: "You have already voted to accept the team member or you do not have permission to do so."
    end
  end
end
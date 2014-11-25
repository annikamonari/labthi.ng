class TeamMembershipsController < ApplicationController

  def create
    if TeamMembership.create(params[:user_id], params[:idea_build_id])
      redirect_to :back, notice: 'The team member has been saved.'
    else
      redirect_to :back, notice: 'There has been an error saving the team member.'
    end
  end
end

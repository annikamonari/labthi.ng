class IdeaRelationshipsController < ApplicationController
  before_action :auth_user!
  def create
    @idea = Idea.find(params[:idea_relationship][:followed_id])
    current_user.follow_idea!(@idea)
    respond_to do |format|
      @idea_relationship = IdeaRelationship.find_by(followed_id: @idea.id)
      format.html {redirect_to @idea}
      format.js
    end
  end

  def destroy
    @idea_relationship = IdeaRelationship.find(params[:id])
    @idea = @idea_relationship.followed
    current_user.unfollow_idea!(@idea)
    respond_to do |format|
      format.html {redirect_to @idea}
      format.js
    end
  end
end
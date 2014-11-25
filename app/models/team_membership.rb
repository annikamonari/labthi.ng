class TeamMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea_build

  def TeamMembership.create(user_id, idea_build_id)
    team_membership            = TeamMembership.new
    team_membership.idea_build = IdeaBuild.find(idea_build_id)
    team_membership.user       = User.find(user_id)
    team_membership.save
  end

end

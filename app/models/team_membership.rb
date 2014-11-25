class TeamMembership < ActiveRecord::Base
  belongs_to :user
  belongs_to :idea_build
end

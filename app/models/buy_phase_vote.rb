class BuyPhaseVote < ActiveRecord::Base
  has_one :user
  has_one :idea

  validates_presence_of :user_id, :idea_id
end

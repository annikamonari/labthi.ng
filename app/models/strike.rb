class Strike < ActiveRecord::Base
  serialize :voter_ids, Array
  validates_presence_of :user_id, :idea_build_id, :voter_id, :strike_number

  def Strike.create(user_id, idea_build_id, voter_id)
    strike = Strike.find_by(user_id: user_id, idea_build_id: idea_build_id)
    
    if strike.nil?
      strike               = Strike.new
      strike.user_id       = user_id
      strike.idea_build_id = idea_build_id
      strike.voter_ids     << voter_id
      strike.strike_number = 1
      strike.strike?
    elsif not strike.voter_ids.include?(voter_id)
      strike.voter_ids << voter_id
      strike.strike?
    end
  end

  private
    VOTES_REQUIRED = 0.5

    def strike?
      if self.is_strike?
        self.strike_number += 1
        
        if self.strike_number == 4
          TeamMemberships.find_by(idea_build_id: self.idea_build_id, user_id: self.user_id).delete
          return self.save
        end

        self.voter_ids = []
      end

      self.save
    end

    def is_strike?
      strike_votes = self.voter_ids.length
      total_votes  = TeamMemberships.where(idea_build_id: idea_build_id).count

      (strike_votes / total_votes.to_f) >= VOTES_REQUIRED
    end
end

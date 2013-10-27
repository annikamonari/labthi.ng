module SharedMethods
	extend ActiveSupport::Concern

  included do
  	has_reputation :votes, source: :user, aggregated_by: :sum
  end

  def set_first_vote
    self.add_or_update_evaluation(:votes, 1, self.user)
  end
end
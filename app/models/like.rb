class Like < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :model_name, :model_id, :user_id
  validate :only_one_like_per_user

  def only_one_like_per_user
    unless Like.find_by(model_name: self.model_name, model_id: self.model_id, user_id: self.user_id).nil?
      errors.add(:base, "You cannot like something more than once")
    end
  end

end

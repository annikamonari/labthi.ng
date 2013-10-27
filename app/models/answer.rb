class Answer < ActiveRecord::Base
  include PublicActivity::Model
  include SharedMethods
  after_create :set_first_vote
  validates :brief, presence: true, length: { maximum: 1000 }
  validates :user, presence: true
  validates :question, presence: true
  belongs_to :question, inverse_of: :answers
  belongs_to :user, -> { includes :profile }, inverse_of: :answers  
  has_many :comments, as: :commentable, :dependent => :destroy

  has_reputation :votes, source: :user, aggregated_by: :sum

  def set_first_vote
    self.add_or_update_evaluation(:votes, 1, self.user)
  end
end

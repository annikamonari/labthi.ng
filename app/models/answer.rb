class Answer < ActiveRecord::Base
  include PublicActivity::Model
  validates :brief, presence: true, length: { maximum: 1000 }
  validates :user, presence: true
  validates :question, presence: true
  belongs_to :question, inverse_of: :answers
  belongs_to :user, -> { includes :profile }, inverse_of: :answers  
  has_many :comments, as: :commentable, :dependent => :destroy

  has_reputation :votes, source: :user, aggregated_by: :sum
  
end

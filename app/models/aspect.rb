class Aspect < ActiveRecord::Base
  validates :brief, presence: true
  validates :user, presence: true
  validates :idea, presence: true

  belongs_to :idea, inverse_of: :aspects
  belongs_to :user, inverse_of: :aspects
  has_many :solutions, inverse_of: :aspect
end

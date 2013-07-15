class Solution < ActiveRecord::Base
  validates :brief, presence: true
  validates :user, presence: true
  validates :aspect, presence: true
  belongs_to :aspect, inverse_of: :solutions  
  belongs_to :user, inverse_of: :solutions  
  has_many :comments, inverse_of: :solution
end

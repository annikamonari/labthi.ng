class Aspect < ActiveRecord::Base
  include PublicActivity::Model
  validates :brief, presence: true
  #has_many :solutions, inverse_of: :aspect, :dependent => :destroy
end

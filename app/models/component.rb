class Component < ActiveRecord::Base
  has_many :parts, -> { includes(:user) }
  belongs_to :idea_build

  # child classes implement create_required_parts
  after_create :create_required_parts
end

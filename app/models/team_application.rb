class TeamApplication < ActiveRecord::Base
  belongs_to :post, -> { includes(:user) }
  belongs_to :user
end

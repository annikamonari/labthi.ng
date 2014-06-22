class Part < ActiveRecord::Base
  belongs_to :user
  belongs_to :component
end

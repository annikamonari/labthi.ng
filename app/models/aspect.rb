class Aspect < ActiveRecord::Base
  belongs_to :idea, inverse_of: :aspects
  belongs_to :user, inverse_of: :aspects
end

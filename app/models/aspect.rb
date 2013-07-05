class Aspect < ActiveRecord::Base
  belongs_to :idea, inverse_of: :aspects
end

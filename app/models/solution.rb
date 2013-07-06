class Solution < ActiveRecord::Base
  belongs_to :aspect, inverse_of :solutions
end

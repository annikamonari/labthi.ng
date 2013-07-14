class Comment < ActiveRecord::Base
	belongs_to :user, inverse_of: :comments
end
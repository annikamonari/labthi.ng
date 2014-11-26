class Post < ActiveRecord::Base
  belongs_to :idea_build
  belongs_to :user
  
end

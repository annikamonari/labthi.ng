class Post < ActiveRecord::Base
  include PublicActivity::Model
  belongs_to :idea_build
  belongs_to :user
  validates_presence_of :title, :content

end

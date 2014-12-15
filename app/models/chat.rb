class Chat < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :body
end

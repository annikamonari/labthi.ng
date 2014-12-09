class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :part
  belongs_to :team_application

  def Vote.create(user_id, object)
    vote = Vote.new
    vote.user = User.find(user_id)
    vote.kind = object.class.name
    vote.kind_id = object.id
    vote.save
  end
end

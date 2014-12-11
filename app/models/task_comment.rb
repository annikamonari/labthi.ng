class TaskComment < ActiveRecord::Base
  belongs_to :user, -> { includes :profile }
  belongs_to :admin_task
  belongs_to :post
  belongs_to :team_application

end

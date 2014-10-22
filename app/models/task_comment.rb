class TaskComment < ActiveRecord::Base
  belongs_to :user, -> { includes :profile }
  belongs_to :admin_task
end

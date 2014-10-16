class TaskComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :admin_task
end

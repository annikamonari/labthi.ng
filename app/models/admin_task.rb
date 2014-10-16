class AdminTask < ActiveRecord::Base
  belongs_to :part
  has_many :task_comments

  def AdminTask.get(part)
    AdminTask.where(part_id: part)
  end

  def disable_button?(user)
    not (user.admin or ['Unstarted', 'Started'].include?(self.status))
  end

  def button_status
    case self.status
    when 'Unstarted'
      'Start'  
    when 'Started'
      'Finish'
    when 'Finished'
      'Review'
    when 'In Review'  
      'Accept'
    when 'Accepted'
      'Accepted' 
    end
  end

end

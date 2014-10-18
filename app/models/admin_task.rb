class AdminTask < ActiveRecord::Base
  belongs_to :part
  belongs_to :user, -> { includes :profile }
  has_many :task_comments

  include PublicActivity::Model
  include LabReputable

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

  def start_rep_points
    self.update_lab_evaluation(1, User.find_by(email: 'alan.vey@gmail.com'))
    self.user.update_lab_rep_points
  end

  def accepted_rep_points 
    self.update_lab_evaluation(5, User.find_by(email: 'alan.vey@gmail.com'))
    self.user.update_lab_rep_points
  end

  def ids
    [['AdminTask', self.id]]
  end

end

class Part < ActiveRecord::Base
  # Used to associate image galaries from bootsy to this model
  include Bootsy::Container

  belongs_to :user
  belongs_to :component

  def idea
    @idea ||= idea_build.idea
  end

  def idea_build
    @idea_build ||= component.idea_build
  end

  def display_button?(user)
    self.status == 'Unstarted' or display_link?(user)
  end

  def display_link?(user)
    review = ['Finished', 'In Review']

    (self.status == 'Started' and self.user == user) or
    (review.include?(self.status) and user.admin)
  end

  def disabled_button?
    self.status != 'Accepted'
  end

  def button_status
    case self.status
    when 'Unstarted'
      'Start'  
    when 'Started'
      'Finish'
    when 'Finished'
      'Revew'
    when 'In Review'  
      'Accept' 
    end
  end

end

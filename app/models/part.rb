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
    review = ['Finished', 'Pending Review']

    self.status == 'Unstarted' or 
    (self.status == 'Started' and self.user == user) or
    (review.include?(self.status) and user.admin)
  end

  def button_status
    if self.status == 'Unstarted'
      'Start'  
    elsif self.status == 'Started'
      'Finish'
    elsif self.status == 'Finished'
      'Revew'
    elsif self.status == 'Pending Review'  
      'Accept' 
    end
  end

end

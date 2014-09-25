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

end

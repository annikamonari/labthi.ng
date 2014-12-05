class Component < ActiveRecord::Base
  has_many :parts, -> { includes(:user, :component) }
  belongs_to :idea_build

  # child classes implement create_required_parts
  after_create :create_required_parts

  def get_progress
    total_equity = 0
    done_equity  = 0

    self.parts.each { |part| total_equity += part.equity.to_i }
    self.parts.where(status: 'Accepted').each { |part| done_equity += part.equity.to_i }
    ('%.0f' % ((done_equity / total_equity.to_f) * 100)).to_i
  end

  def get_color
    if self.get_progress == 0
      '#333333;margin-left:10px;'
    else
      '#fff'
    end
  end
end

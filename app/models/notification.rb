class Notification < ActiveRecord::Base
  belongs_to :user

  def Notification.create(parent, child_id, kind, user_id = nil)
    notification           = Notification.new
    notification.kind_id   = parent.id
    notification.kind_2_id = child_id
    notification.kind      = kind
    notification.read      = false
    
    if user_id
      notification.user_id = user_id
    elsif parent.class.name == 'IdeaBuild'
      notification.user_id = parent.idea.user.id
    else
      notification.user_id = parent.user.id
    end
    notification.save!
  end

  def get_parent_action(child_kind, parent_kind)
    case child_kind
    when 'comment'
      if parent_kind == 'comment'
        'on your comment.'
      elsif parent_kind == 'solution'
        "on your solution."
      elsif parent_kind == 'answer'
        "on your answer."
      else
        "on your question."
      end
    when 'answer'
      "on your question."
    when 'post', 'proposal'
      "on an idea you're a core team member of."
    when 'application'
      "on a proposal written by your team member."
    when 'taskcomment'
      if parent_kind == 'post'
        "on a post written by your team member."
      elsif parent_kind == 'application'
        "on your application."
      else
        "on a task written by your team member."
      end
    when 'chat'
      if parent_kind == 'part'
        "in a part discussion of an idea you're a core team member of."
      else
        "in a general discussion of an idea you're a core team member of."
      end
    end
  end

  def get_child_action(child_kind)
    case child_kind
    when 'comment'
      'posted a'
    when 'answer'
      'posted an'
    when 'post'
      'wrote a'
    when 'proposal'
      'wrote a'
    when 'application'
      'submitted an'
    when 'taskcomment'
      'posted a'
    when 'chat'
      'wrote a'
    end
  end

  def get_child_user(child_kind)
    if child_kind == 'taskcomment'
      TaskComment.find(self.kind_2_id).user
    elsif child_kind == 'application'
      TeamApplication.find(self.kind_2_id).user
    elsif child_kind == 'proposal'
      Post.find(self.kind_2_id).user
    else
      child_kind.classify.constantize.find(self.kind_2_id).user     
    end
  end

  def child_kind
    self.kind[/_\S+/].sub('_', '')
  end

  def parent_kind
    self.kind[/\S+_/].sub('_', '')
  end
end

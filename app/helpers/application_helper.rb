module ApplicationHelper
  # Detect current page
  def nav_link(link_text, link_path, className = "")
    class_name = current_page?(link_path) ? 'active' : ''
    class_name += " " + className if className.length > 0
    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end
  def active_when(path)
    current_page?(path) ? 'active' : ''
  end
# Use Bootstrap for our statuses
  def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-danger"
      when :alert
        "alert-warning"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end


  def vote_order(items)
    items.sort_by {|a| a.lab_rep}.reverse
  end

#link_to(vote_path(voteable_id: voteable.id, voteable_class: voteable.class, type: type)
  def foo_vote_path(voteable_id, voteable_class, type)
    case voteable_class.to_s
      when "Comment"
        comment_vote_path(voteable_id: voteable_id, voteable_class: voteable_class, type: type)
      when "Question"
        question_vote_path(voteable_id: voteable_id, voteable_class: voteable_class, type: type)
      when "Answer"
        answer_vote_path(voteable_id: voteable_id, voteable_class: voteable_class, type: type)
      when "Solution"
        solution_vote_path(voteable_id: voteable_id, voteable_class: voteable_class, type: type)
      when "Idea"
        idea_vote_path(voteable_id: voteable_id, voteable_class: voteable_class, type: type)
    end
  end

  def summary_of_business
    @brief        = @idea_build.plan_component.parts.find_by(name: 'Brief').value
    @team         = @idea_build.team_memberships.map { |t| t.user } 
    @users_points = User.sum_points(@idea.get(:local_reputation)).reject { |user| user unless @team.include?(user[0])}
    @team.each do |user| 
      unless (@users_points.map {|u| u[0]}).include?(user)
        @users_points << [user, 0] 
      end
    end
  end

  def get_team_votes(object)
    Vote.where(kind: object.class.name, kind_id: object.id).includes(:user).map { |vote| vote.user }
  end

  def get_chat_title(chats)
    if params[:kind] == 'idea_build'
      'General Idea Build Discussion'
    else
      part_name = Part.find(params[:kind_id]).name 
      "#{part_name} Discussion"
    end
  end

  def get_chat_kind(chats)
    chats.first.kind
  end

  def get_team_members(idea_build)
    TeamMembership.where(idea_build_id: idea_build.id).includes(:user).map { |tm| tm.user }
  end

  def mentions_to_link(message_body)
    mentions = Array.new
    message_body.scan(/@\S+\b/) { |user| mentions << user }
    mentions.each do |m|
      message_body.sub!(m, "<a href='/profiles/#{split_mention(m)}'>#{m}</a>")
    end
    message_body
  end

  def split_mention(mention)
    username = mention.sub('@', '').split('_')
    User.find_by(first_name: username[0].capitalize, last_name: username[1].capitalize).id
  end

  def get_child_path(notification, child_kind, parent_kind)
    case child_kind
    when 'comment'
      parent = Comment.find(notification.kind_id)
      if parent_kind == 'comment'
        if parent.commentable_type == 'Solution'
          "#{aspect_path(Solution.find(parent.commentable_id).aspect)}"
        elsif parent.commentable_type == 'Answer'
          "#{question_path(Answer.find(parent.commentable_id).question)}"
        elsif parent.commentable_type == 'Question'
          "#{question_path(Question.find(parent.commentable_id))}"
        end
      elsif parent_kind == 'solution'
        "#{aspect_path(Solution.find(notification.kind_id).aspect)}"
      elsif parent_kind == 'answer'
        "#{question_path(Answer.find(notification.kind_id).question)}"
      else
        "#{question_path(Question.find(notification.kind_id))}"
      end
    when 'answer'
      "#{question_path(Question.find(notification.kind_id))}"
    when 'post'
      "#{idea_build_feed_path(IdeaBuild.find(notification.kind_id).idea)}"
    when 'proposal'
      "#{post_path(post_id: Post.find(notification.kind_2_id), idea_id: Post.find(notification.kind_2_id).idea_build.idea_id)}"
    when 'application'
      "#{post_path(post_id: Post.find(notification.kind_id), idea_id: Post.find(notification.kind_id).idea_build.idea_id)}"
    when 'taskcomment'
      if parent_kind == 'post'
        "#{post_path(post_id: Post.find(notification.kind_id), idea_id: Post.find(notification.kind_id).idea_build.idea_id)}"
      elsif parent_kind == 'application'
        "#{post_path(post_id: TeamApplication.find(notification.kind_id).post_id, idea_id: TeamApplication.find(notification.kind_id).post.idea_build.idea_id)}"
      else
        "#{part_admin_tasks_path(id: AdminTask.find(notification.kind_id).part.id, idea_id: AdminTask.find(notification.kind_id).part.idea.id)}"
      end
    when 'chat'
      if parent_kind == 'part'
        "#{new_chat_path(idea_id: Part.find(notification.kind_id).idea.id, kind: 'part', kind_id: Part.find(notification.kind_id).id)}"
      else
        "#{new_chat_path(idea_id: IdeaBuild.find(notification.kind_id).idea.id, kind: 'idea_build', kind_id: IdeaBuild.find(notification.kind_id).id)}"
      end
    end
  end
end




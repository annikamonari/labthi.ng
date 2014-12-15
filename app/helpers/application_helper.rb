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
end




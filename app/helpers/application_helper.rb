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


  def sum_points(users_points)
    sorted             = users_points.sort_by { |u| u[0] }
    points             = 0
    summed_users_points = Array.new

    (0..sorted.length - 1).each do |i|
      user    = sorted[i][0]
      points += sorted[i][1]

      if sorted[i + 1].nil? or sorted[i + 1][0] != user
        summed_users_points << [user, points]
        points = 0
      end
    end
    (summed_users_points.sort_by {|u| -u[1]})[0..4]  
  end

  def summary_of_business
    @brief        = @idea_build.plan_component.parts.find_by(name: 'Brief').value
    @team         = @idea_build.team_memberships.map { |t| t.user } 
    @users_points = sum_points(@idea.get(:local_reputation)).reject { |user| user unless @team.include?(user[0])}
    @team.each do |user| 
      unless (@users_points.map {|u| u[0]}).include?(user)
        @users_points << [user, 0] 
      end
    end
  end

  def get_team_votes(object)
    Vote.where(kind: object.class.name, kind_id: object.id).includes(:user).map { |vote| vote.user }
  end
end




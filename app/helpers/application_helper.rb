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
end

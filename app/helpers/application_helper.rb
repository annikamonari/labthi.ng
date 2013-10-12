module ApplicationHelper
  # Detect current page
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''
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

  def idea_top_image(idea)
    @idea_top_image = nil
    image_aspect = Aspect.where(title:"Image").take
    if (image_aspect)
      @solution = Solution.where(aspect_id: image_aspect.id, idea_id: idea.id).sort_by {|a| a.reputation_for(:votes)}.last
      @idea_top_image = @solution if @solution
    end
    return @idea_top_image
  end
end

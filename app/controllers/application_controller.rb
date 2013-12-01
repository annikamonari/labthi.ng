class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception

  	before_filter :configure_permitted_parameters, if: :devise_controller?
  	protect_from_forgery with: :exception

    layout :layout_by_resource
    
  	protected
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation) }
  	end
  	
    def auth_user!(opts = {})
        authenticate_user!
    end
    def layout_by_resource
      if devise_controller?
        "form_left"
      else
        "application"
      end
    end

  def set_vote_value
    case params[:type]
      when "up"
        @value = 1
      when "down"
        @value = -1
      when "undo"
        @value = 0
    end
  end

  def update_user_vote_rep(voteable, previous_votes, value, up_pts, down_pts = up_pts)
    # check if vote is 'undo'
    vote_change = previous_votes - voteable.reputation_for(:votes)
    vote_change += value
      # Check if last vote was an upvote
      if vote_change > 0
        # Subtract previously gained points
        voteable.user.subtract_points(up_pts)
      elsif vote_change < 0
        # Regain lost points
        current_user.add_points(down_pts)
        voteable.user.add_points(up_pts)
      end

      voteable.user.add_points(up_pts) if value == 1
      current_user.subtract_points(down_pts) if value == -1
      voteable.user.subtract_points(up_pts) if value == -1
  end
end

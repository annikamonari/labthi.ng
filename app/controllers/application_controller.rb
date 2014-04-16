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
  	  devise_parameter_sanitizer.for(:account_update) { |u| u.permit( :password, :password_confirmation, :reset_password_token) }
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
end

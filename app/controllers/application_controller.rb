class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception

  	before_filter :configure_permitted_parameters, if: :devise_controller?
  	protect_from_forgery with: :exception
  	protected
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
  	end
  	
    def auth_user!(opts = {})
      if admin_user_signed_in?
        authenticate_admin!
      else
        authenticate_user!
      end
    end

    def set_categories
    @categories = [
        "Advertising & Media",
        "Arts & Entertainment",
        "Business & Finance",
        "Education",
        "Energy & Utilities",
        "Food & Health",
        "Science & Technology",
        "Social",
        "Travel & Leisure",
        "Retail",
        "Other"
      ]
    end
    def set_components
      @components = [
        "Website",
        "App",
        "Software",
        "Hardware",
        "Good",
        "Service"
      ]
    end

    #def after_sign_in_path_for(resource_or_scope)
      #user_show_path(current_user)
    #end
end

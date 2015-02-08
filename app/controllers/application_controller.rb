class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception

  	before_filter :configure_permitted_parameters, if: :devise_controller?
    before_action :auth_user!, except: [:passwords, :registrations, :sessions, :home]
  	protect_from_forgery with: :exception

    layout :layout_by_resource

    include ApplicationHelper
    
  	protected
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :university, :password_confirmation) }
  	  devise_parameter_sanitizer.for(:account_update) { |u| u.permit( :password, :password_confirmation, :reset_password_token) }
    end
  	
    def auth_user!(opts = {})
      authenticate_user!
    end
    def layout_by_resource
      if devise_controller?
        "devise_form_left"
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

  def enough_votes?(object_id, idea_build_id)
    (Vote.where(kind_id: object_id).length.to_f / TeamMembership.where(idea_build_id: idea_build_id).length) > 0.5
  end

  def team_member
    unless current_user.team_member?(@idea)
      redirect_to idea_build_feed_path(@idea), notice: 'You are not part of the team and therefore cannot view this content.'
    end
  end

  def load_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find_by_id(id)
    @commentable = commentable_from_params unless @commentable
  end

  def commentable_from_params
    commentable_type = params[:commentable_type]
    id = params[:commentable_id]
    @commentable = commentable_type.singularize.classify.constantize.find_by_id(id) unless commentable_type == nil
  end

end

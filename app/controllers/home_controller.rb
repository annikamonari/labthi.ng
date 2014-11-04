class HomeController < ApplicationController
  #before_filter :authenticate_user!
  def index
    render layout: 'sidebar_signup'
  end

  def dashboard
  	@user_activities   = PublicActivity::Activity.includes(:owner, :trackable).where(owner: current_user).order("created_at desc")
    @follow_activities = current_user.get_followed_idea_activity

    render layout: 'sidebar_right'
  end

  def followed_ideas
    @user_activities   = PublicActivity::Activity.includes(:owner, :trackable).where(owner: current_user).order("created_at desc")
    @follow_activities = current_user.get_followed_idea_activity

    render layout: 'sidebar_right'
  end
  
  def documentation
  end
end

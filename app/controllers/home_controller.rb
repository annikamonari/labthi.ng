class HomeController < ApplicationController
  skip_before_filter :auth_user!, only: [:index, :terms, :privacy]
  
  def index
    return redirect_to dashboard_path unless current_user.nil?

    render layout: 'sidebar_signup'
  end

  def dashboard
  	@user_activities   = PublicActivity::Activity.includes(:owner, :trackable).where(owner: current_user).order("created_at desc").take(20)
    @follow_activities = current_user.get_followed_idea_activity

    render layout: 'sidebar_right'
  end

  def followed_ideas
    @user_activities   = PublicActivity::Activity.includes(:owner, :trackable).where(owner: current_user).order("created_at desc").take(20)
    @follow_activities = current_user.get_followed_idea_activity

    render layout: 'sidebar_right'
  end
  
  def documentation
  end

  def terms
  end

  def privacy
  end

end
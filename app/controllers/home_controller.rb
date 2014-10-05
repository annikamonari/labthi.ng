class HomeController < ApplicationController
  #before_filter :authenticate_user!
  def index
    render layout: 'sidebar_right'
  end

  def dashboard
  	@activities = PublicActivity::Activity.includes(:owner, :trackable).where(owner: current_user).order("created_at desc")
  	render layout: 'sidebar_right'
  end

  def documentation
  end
end

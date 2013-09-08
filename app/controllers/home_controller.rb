class HomeController < ApplicationController
  #before_filter :authenticate_user!
  def index
  	#if user_signed_in? then
  	#	render 'home/dashboard'
  	#else
    	render layout: 'sidebar_right'
		#end
  end

  def dashboard
  	@test = 'it worked'
  	render layout: 'sidebar_right'
  end
end

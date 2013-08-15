class ProfileController < ApplicationController
	before_action :auth_user!
  before_action :set_profile, only: [:show]
  before_action :get_user
  before_action :get_profile, only: [:edit]

  def show
  end

  def edit
  end

  def create
  end

	private
	  def set_profile
	  	@profile = Profile.find(params:id)
	  end
	  def get_profile
	  	@profile = Profile.find_by user_id: @user.id
	  	unless @profile
	  		@profile = Profile.new(user_id: @user.id)
	  	end
	  end
	  def get_user
	  	@user = current_user
	  end
end

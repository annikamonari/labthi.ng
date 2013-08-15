class ProfilesController < ApplicationController
	before_action :auth_user!
  before_action :set_profile, only: [:show]
  before_action :get_user
  before_action :get_profile, only: [:edit, :update]

  def show
  end

  def edit
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        @profile.create_activity :update, owner: (current_user || current_admin)
        format.html { redirect_to @profile, notice: 'Successfully updated profile.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

	private
	  def set_profile
	  	@profile = Profile.find(params[:id])
	  end
	  def get_profile
	  	@profile = Profile.first_or_create user_id: @user.id
	  end
	  def get_user
	  	@user = current_user
	  end
	  def profile_params
      params.require(:profile).permit(:profession, :about, :age, :country, :website)
    end
end

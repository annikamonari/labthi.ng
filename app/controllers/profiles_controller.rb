class ProfilesController < ApplicationController
	before_action :auth_user!, except: [:show]
  before_action :set_profile, only: [:show, :edit, :update, :labs]
  before_action :get_user, only: [:show, :edit, :update, :labs]

  def show
    @activities = PublicActivity::Activity.includes(:owner, :trackable).where(owner: @user).order("created_at desc")
    render layout: 'sidebar_left'
  end

  def edit
    redirect_to @profile unless current_user == @profile.user
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    if current_user == @profile.user
      respond_to do |format|
        if @profile.update(profile_params)
          @profile.create_activity :update, owner: (current_user || current_admin_user)
          format.html { redirect_to @profile, notice: 'Successfully updated profile.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @profile.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def labs
    render layout: 'sidebar_left'
  end

	private
	  def set_profile
      if params[:id]
        @profile = Profile.find(params[:id])
      else
        @profile = current_user.profile
      end
	  end
	  def get_user
	  	@user = User.find(@profile.user_id)
	  end
	  def profile_params
      params.require(:profile).permit(:profession, :about, :age, :country, :website, :photo)
    end
end

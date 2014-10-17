class PartsController < ApplicationController
  before_action :set_part
  before_action :auth_user!

  def edit
    @users = @part.bitbucket.get_users if @part.name == 'Prototype'
    @admin_tasks   = AdminTask.get(@part.id)
  end

  def clear
    @part.value = nil
    @part.user = nil
    @part.save

    if @part.is_business_plan or @part.is_plan?
      @part.part_uploads.each { |u| u.delete }
    elsif @part.name == 'Prototype'
      @part.bitbucket.delete_users
    end

    redirect_to idea_build_path(@part.idea)
  end

  def add_user_to_repo
    if @part.bitbucket.post_user(params[:part][:value]) == 200
      redirect_to :back, notice: "The email invitation was successfully sent."
    else
      redirect_to :back, notice: "An error occured adding the user."
    end
  end

  def remove_user_from_repo
    user = params[:user]

    @part.bitbucket.delete_users(user)

    redirect_to :back, notice: "The user was successfully removed."
  end

  def update_image
    @upload = nil
    if params[:part_upload]
      @upload = PartUpload.new
      @upload.image = params[:part_upload]['image']
      @upload.part = @part
    end

    respond_to do |format|
      if (@upload ? @upload.save : true)
        format.html {redirect_to :back, notice: 'Part was successfully updated.'}
      else
        format.html {redirect_to :back, notice: 'Part was not updated due to an error.'}
      end
    end
  end

  def update
    respond_to do |format|
      if @part.update(part_params)
        format.html {redirect_to :back, notice: 'Part was successfully updated.'}
      else
        format.html {redirect_to :back, notice: 'Part was not updated due to an error.'}
      end
    end
  end

  # Used for status setting
  def update_status
    case @part.status
    when 'Unstarted'
      @part.status = 'Started'
      @part.user   = current_user
      @part.bitbucket.post_user(current_user.email) if @part.name == 'Prototype'
      @part.start_rep_points
    when 'Started'
      @part.status = 'Finished'
    when 'Finished' 
      @part.status = 'In Review'
    when 'In Review'
      @part.status = 'Accepted'
      @part.accepted_rep_points
    end
    @part.save
    redirect_to :back
  end
  
  # Used for status setting
  def unstart_part
    @part.unstart_rep_points
    @part.status = 'Unstarted'
    @part.user   = nil
    @part.save

    @part.bitbucket.delete_users if @part.name == 'Prototype'

    redirect_to idea_build_path(@part.idea), notice: 'You successfully unstarted the part.'
  end

  def set_part
    @part = Part.find(params[:id])
  end

  def part_params
    params.require(:part).permit(:value, :email, :user, :bootsy_image_gallery_id, part_upload_attributes: [:image])
  end

end

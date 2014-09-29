class PartsController < ApplicationController
  before_action :set_part
  before_action :auth_user!

  def edit
  end

  def clear
    @part.value = nil
    @part.user = nil
    @part.part_uploads.each { |u| u.delete }
    @part.save

    redirect_to idea_build_path(@part.idea)
  end

  def update_image
    @upload = nil
    if params[:part_uploads]
      @upload = PartUpload.new
      @upload.image = params[:part_uploads]['image']
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

  def update_status
    case @part.status
    when 'Unstarted'
      @part.status = 'Started'
      @part.user   = current_user
    when 'Started'
      @part.status = 'Finished'
    when 'Finished' 
      @part.status = 'In Review'
    when 'In Review'
      @part.status = 'Accepted'
    end
    @part.save
    redirect_to idea_build_path(@part.idea)
  end

  def set_part
    @part = Part.find(params[:id])
  end

  def part_params
    params.require(:part).permit(:value, :bootsy_image_gallery_id, part_uploads_attributes: [:image])
  end

end

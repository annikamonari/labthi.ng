class PartsController < ApplicationController
  before_action :set_part
  before_action :auth_user!

  def edit
  end

  def clear
    @part.value = nil
    @part.user = nil
    @part.save

    redirect_to @part.idea_build
  end

  def update
    @part.user = current_user
    respond_to do |format|
      if @part.update(part_params)
        format.html {redirect_to idea_build_path(@part.idea)}
      else
        format.html {redirect_to idea_build_path(@part.idea)}
      end
    end
  end

  def set_part
    @part = Part.find(params[:id])
  end

  def part_params
    params.require(:part).permit(:value, :bootsy_image_gallery_id)
  end

end

class PartUploadController < ApplicationController
  def destroy
    PartUpload.find(params[:upload_id]).destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'The image was sucessfully removed.' }
    end
  end
end

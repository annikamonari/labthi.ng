class PartsController < ApplicationController
  before_action :set_part

  def edit
  end

  def clear
    @part.value = nil
    @part.user = nil
    @part.save
    redirect_to @part.idea_build
  end

  def set_part
    @part = Part.find(params[:id])
  end

end

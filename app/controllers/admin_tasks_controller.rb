class AdminTasksController < ApplicationController
  before_action :auth_user!

  def new
    @admin_task = AdminTask.new
  end

  def create
    @admin_task          = AdminTask.new(admin_task_params)
    @admin_task.part_id  = params[:id]
    @admin_task.admin_id = current_user.id
    @admin_task.status   = 'Unstarted'

    respond_to do |format|
      if @admin_task.save
        format.html { redirect_to edit_part_path, notice: 'Admin task was successfully created.' }
      else
        format.html { redirect_to :back, notice: 'Saving admin task failed' }
      end
    end
  end

  def update_status
    @admin_task = AdminTask.find(params[:id])
    case @admin_task.status
    when 'Unstarted'
      @admin_task.status = 'Started'
    when 'Started'
      @admin_task.status = 'Finished'
    when 'Finished' 
      @admin_task.status = 'In Review'
    when 'In Review'
      @admin_task.status = 'Accepted'
    end
    @admin_task.save
    redirect_to :back, notice: "Status updated to #{@admin_task.status}"
  end

  private

    def admin_task_params
      params.require(:admin_task).permit(:title, :description)
    end
end

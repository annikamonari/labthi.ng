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
      @admin_task.user = current_user
      @admin_task.start_rep_points
      @admin_task.create_activity key: 'admin_task.started', owner: current_user
    when 'Started'
      @admin_task.status = 'Finished'
      @admin_task.create_activity key: 'admin_task.finished', owner: current_user
    when 'Finished' 
      @admin_task.status = 'In Review'
      @admin_task.create_activity key: 'admin_task.in_review', owner: current_user
    when 'In Review'
      @admin_task.status = 'Accepted'
      @admin_task.accepted_rep_points
      @admin_task.create_activity key: 'admin_task.accepted', owner: current_user
    end
    @admin_task.save
    redirect_to :back, notice: "Status updated to #{@admin_task.status}"
  end

  private

    def admin_task_params
      params.require(:admin_task).permit(:title, :description)
    end
end

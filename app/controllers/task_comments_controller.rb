class TaskCommentsController < ApplicationController
  before_action :auth_user!

  def new
    @task_comment = TaskComment.new
    @task = AdminTask.find(params[:admin_task_id])
    respond_to do |format|
      format.js {render template: 'task_comments/new'}
    end
  end

  def create
    @task_comment                = TaskComment.new(task_comment_params)
    @task_comment.admin_task_id  = params[:admin_task_id]
    @task                        = AdminTask.find(params[:admin_task_id])
    @task_comment.user_id        = current_user.id

    respond_to do |format|
      if @task_comment.save
        format.html { redirect_to part_admin_tasks_path, notice: 'Comment successfully created.' }
      else
        format.html { redirect_to :back, notice: 'There has been an error creating your comment. Please try again.' }
      end
    end
  end

  private

    def task_comment_params
      params.require(:task_comment).permit(:comment)
    end
end

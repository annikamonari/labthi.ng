class NotificationsController < ApplicationController

  def index
    @notifications = current_user.notifications
    
    @notifications.each do |notification|
      notification.update_attribute(:read, true)
    end

    @unread_count = @notifications.where(read: false).count

    respond_to do |format|
      format.js { }
    end
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy!
    @notifications = current_user.notifications

    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Notification has been deleted.' }
      format.js { }
    end
  end

  private

    def notification_params
      params.require(:notification).permit(:kind, :kind_id, :user_id, :read)
    end
end


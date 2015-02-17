class NotificationsController < ApplicationController

  def index
    @notifications = current_user.notifications
    
    @notifications.update_all(:read, true)

    @unread_count = @notifications.where(read: false).count

    respond_to do |format|
      format.js { }
    end
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy

    @notifications = current_user.notifications
    respond_to do |format|
      format.js { render template: "notifications/destroy", :layout => false }
    end
  end

end


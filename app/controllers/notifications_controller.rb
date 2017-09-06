class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show]
  
  def show
    @notification.read = true
    @notification.save
    redirect_to users_path
  end
  
  private
  def set_notification
    @notification = Notification.find(params['id'])
  end
  
end

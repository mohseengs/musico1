class NotificationsController < ApplicationController
  def index
    @notifications = current_user.recieved_notifications
  end
end

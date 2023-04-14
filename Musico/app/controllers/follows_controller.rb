class FollowsController < ApplicationController
  def index
    @followings = current_user.followings
    @followers = current_user.followers
  end

  def create
    @user = User.find(params[:user_id])
    follow = Follow.new
    follow.follower = current_user
    follow.following = @user
    follow.save!
    send_notification(follow)
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.followings.destroy(@user)
  end

  private

  def send_notification(follow)
    @notification = Notification.new
    @notification.notifiable_id = follow.id
    @notification.notifiable_type = :follow
    @notification.sender = current_user
    @notification.recievers << follow.follower
    @notification.save
  end
end

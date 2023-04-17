class FollowsController < ApplicationController
  def index
    @followings = current_user.followings
    @followers = current_user.followers
  end

  def create
    @user = User.find(params[:following_id])
    follow = Follow.create(follow_params.merge(follower: current_user))
    send_notification(follow)
  end

  def destroy
    @user = User.find(params[:following_id])
    current_user.followings.destroy(@user)
  end

  private

  def send_notification(follow)
    @notification = Notification.new(notifiable_id: follow.id , notifiable_type: :follow, sender: current_user)
    @notification.recievers << follow.follower
    @notification.save
  end

  def follow_params
    params.permit(:following_id)
  end
end

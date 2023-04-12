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
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.followings.destroy(@user)
  end
end

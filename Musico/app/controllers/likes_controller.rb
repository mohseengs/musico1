class LikesController < ApplicationController
  def index
    @likes = current_user.likes
  end

  def create
    like = Like.new(likeable: get_likeable , user: current_user)
    if like.save!
      send_notification(like)
    end
  end

  def destroy
    @likeable = get_likeable
    current_user.likes.find_by(likeable: @likeable).destroy!
  end

  private 
  def get_likeable 
    if params[:likeable_type] == 'Song'
      @likeable = Song.find(params[:likeable_id])
    elsif params[:likeable_type] == 'Playlist'
      @likeable = Playlist.find(params[:likeable_id])      
    end
  end
  
  def like_params 
    params.require(:like).permit(:likeable_type , :likeable_id)
  end

  def send_notification(like)
    @notification = Notification.new(notifiable_id: like.id , notifiable_type: :like , sender: current_user )
    if params[:likeable_type] == "Song"
      @notification.recievers << like.likeable.users
    elsif params[:likeable_type] == "Playlist"
      @notification.recievers << like.likeable.user
    end
    @notification.save!
  end

end

class LikesController < ApplicationController
  def index
    @likes = current_user.likes
  end

  def create
    like = Like.new
    like.user = current_user
    @likeable = get_likeable
    like.likeable = @likeable
    if like.save!
      send_notification(@likeable)
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

  def send_notification(likeable)
    @notification = Notification.new
    @notification.notifiable_id = likeable.id
    @notification.notifiable_type = :like
    @notification.sender = current_user
    if params[:likeable_type] == "Song"
      @notification.recievers << likeable.users
    elsif params[:likeable_type] == "Playlist"
      @notification.recievers << likeable.user
    end
    @notification.save!
  end

end

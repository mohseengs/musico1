class LikesController < ApplicationController
  def index
    @likes = current_user.likes
  end

  def create
    like = Like.new
    like.user = current_user
    if params[:playlist_id]
      like.likeable = Playlist.find(params[:playlist_id])
    elsif params[:song_id]
      like.likeable = Song.find(params[:song_id])
    end
    like.save!
    render json: 'unlike' 
  end

  def destroy
    Like.find(params[:id]).destroy!
    render json: 'unlike'    
  end
end

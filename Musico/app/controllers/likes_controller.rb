class LikesController < ApplicationController
  def index
    @likes = current_user.likes
  end

  def create
    like = Like.new
    like.user = current_user
    @likeable = get_likeable
    like.likeable = @likeable
    like.save!
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
end

class PlaylistSongsController < ApplicationController
  before_action :set_playlist,  only: [:index , :new, :create, :destroy]

  def index

  end

  def new

  end

  def create
    @playlist.songs << Song.where(id: params[:songs])
        
    render :index
  end

  def destroy
    @playlist.songs.find(params[:id]).destroy! 
    
    render :index
  end


  def search_song
    query = params[:query]
    @songs = Song.where("name LIKE ?", "%" + query + "%")
  end

  private
  def set_playlist
    @playlist = Playlist.find_by_id(params[:playlist_id])
  end
 
end

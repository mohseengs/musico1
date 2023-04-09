class SearchController < ApplicationController
  def index
  end
  def search
    query = params[:query]
    @users = User.search(query , current_user.id)
    @songs = Song.search(query)
    @playlists = Playlist.search(query)
  end
end

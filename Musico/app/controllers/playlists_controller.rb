class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[ show edit update destroy ]

  # GET /playlists or /playlists.json
  def index
    @playlists = Playlist.all
  end

  # GET /playlists/new
  def new
    @playlist = Playlist.new
  end

  # GET /playlists/1/edit
  def edit
  end

  def show
    redirect_to playlist_playlist_songs_path(@playlist)
  end

  # POST /playlists or /playlists.json
  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user = current_user

      if @playlist.save
        redirect_to new_playlist_playlist_song_path(@playlist), notice: "Playlist was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /playlists/1 or /playlists/1.json
  def update
      if @playlist.update(playlist_params)
        redirect_to playlist_url(@playlist), notice: "Playlist was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  # DELETE /playlists/1 or /playlists/1.json
  def destroy
    @playlist.destroy!

      redirect_to playlists_url, notice: "Playlist was successfully destroyed."
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def playlist_params
      params.require(:playlist).permit(:name, :description, :thumbnail)
    end
end
